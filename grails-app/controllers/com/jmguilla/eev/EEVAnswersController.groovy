package com.jmguilla.eev

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional



class EEVAnswersController {

  def EEVQuestionsService
  def EEVAnswersServicelean
  def springSecurityService
  def pdfRenderingService

  def list(){
  }

  @Secured(['ROLE_OWNER'])
  def sendPDF(){
    withFormat{
      json{
        if(!request.xhr && params.format.equalsIgnoreCase("json")){
          response.status = 400
          respond([type: 'danger', content: 'L\'envoie de pdf n\'est possible qu\'en JSON/xhr.'])
        }
        if(!params.id){
          response.status = 404
          respond([type: 'danger', content: "L'id de l'EEV � envoyer est requis"])
        }
        EEVAnswers eev = EEVAnswers.get(params.id)
        if(!eev){
          response.status = 404
          respond([type: 'danger', content: "Aucun EEV ne correspond à l'id ${params.id}"])
        }
        try{
          sendMail {
            multipart true
            from "Ecoute Entretien Vente <ecoute.entretien.vente@gmail.com>"
            to springSecurityService.getCurrentUser().email
            subject "EEV #${params.id} du ${eev.creationDate} pour '${eev.interviewee?:'Inconnu'}'"
            html "<a href=\"${g.createLink(controller: 'EEVAnswers', action: 'show', id: params.id, absolute: true)}.pdf\">Consultable ici </a> et pr&eacute;sent en pi&egrave;ce jointe."
            attach ("${eev.interviewee?:'inconnu'}-${eev.id}.pdf", "application/pdf", pdfRenderingService.render(template: "/EEVAnswers/pdf", model: [eev: eev]).toByteArray())
          }
          respond([type: 'success', content: 'Email envoyé'])
        }catch(Throwable t){
          log.error(t)
          response.status = 500
          respond([type: 'danger', content: "Envoie d'email impossible en raison de: ${t.toString()}"])
        }
      }
    }
  }

  @Transactional(readOnly = true)
  @Secured(['ROLE_OWNER'])
  def listJSON(){
    withFormat{
      json{
        if(!request.xhr && params.format.equalsIgnoreCase("json")){
          redirect action: 'list'
          return
        }
        def result = EEVAnswers.executeQuery('select a from EEVAnswers a inner join fetch a.eevQuestions as eevQuestions order by eevQuestions.id, a.creationDate')
        JSON.use('answersList'){ render(result as JSON) }
      }
    }
  }

  def offline(){
    withFormat{
      json{
        render([] as JSON)
      }
    }
  }

  @Transactional
  def answer() {
    withFormat{
      json{
        try{
          def eevQuestions = EEVQuestions.get(request.JSON.eevId)
          if(!eevQuestions){
            respond([type: "danger", content: "Aucun EEV ne correspond a l'identifiant: ${request.JSON.eevId}"])
            return
          }
          if(!request.JSON.answers){
            respond([type: "danger", content: "Vous n'avez répondu à aucune question..."])
            return
          }
          def eevAnswers = new EEVAnswers(eevQuestions: eevQuestions)
          bindData(eevAnswers, request.JSON, [exclude: [
              'answers',
              'class',
              'id',
              'version'
            ]])
          eevAnswers = eevAnswers.save(failOnError: true)
          def answers = request.JSON.answers
          def questions = Question.findAll("from Question as q where q.id in (:ids)", [ids: answers.collect{ k, v ->
              Long.parseLong(k)
            }])
          answers.each{ qid, value ->
            def question = questions.find{ q ->
              q.id == Long.parseLong(qid)
            }
            def answer = null
            if(value){
              answer = Class.forName(question.answerType).newInstance()
              answer.setAnswer value
              answer.question = question
              answer.eev = eevAnswers
              answer = answer.save(failOnError: true)
            }
          }
          JSON.use('deep'){
            respond([type: "success", content: "EEV repondu avec succes", model:[eev: eevQuestions]])
          }
        }catch(Throwable t){
          log.error("Cannot create ${EEVAnswers}", t)
          respond([type: 'danger', content: "Cannot perform the action: ${t}"])
        }
      }
      '*'{
        response.status = 400
        respond([type: "danger", content:"Only json method is allowed for creation."])
      }
    }
  }

  @Secured(['ROLE_ADMIN'])
  @Transactional
  def show(){
    withFormat{
      pdf{
        if(!params.id){
          response.sendError(400, "Un id doit etre fourni")
          return
        }
        def eev = EEVAnswers.get(Integer.parseInt(params.id))
        if(!eev){
          response.sendError(400, "Aucun EEV ne correspond a cet id: ${params.id}")
          return
        }
        renderPdf(template: "pdf", model: [eev: eev], filename: "${eev.interviewee?:'inconnu'}-${eev.id}.pdf")
        //        render(view: "_pdf", model: [eev: eev], filename: "eev-${eev.id}")
      }
      html{
        if(!params.id){
          response.sendError(404)
        }
        render view: 'show', model: [params: params]
      }
      '*'{
        response.status = 400
        respond([type: "danger", content:"Only html / json method are allowed for edition."])
      }
    }
  }

  @Secured(['ROLE_ADMIN'])
  @Transactional
  def deleteEEV(){
    if(!request.method.equalsIgnoreCase('DELETE')){
      response.status = 400
      respond([type: 'danger', content: 'Seulement la méthode DELETE est authorisée.'])
    }
    if(!params.id){
      response.status = 400
      respond([type: 'danger', content: 'Un id doit être fourni pour la suppression.'])
    }
    def eev = EEVAnswers.get(params.id)
    if(!eev){
      response.status = 404
      respond([type: 'danger', content: "Aucun EEV ne correspond à l\'id ${params.id}"])
    }
    eev.delete()
    respond([type: 'success', content: "L\'EEV #${params.id} a été supprimé."])
  }

  @Secured(['ROLE_ADMIN'])
  @Transactional(readOnly = true)
  def getEEV(){
    withFormat{
      json{
        if(!params.id){
          response.status = 404
          respond([type: 'danger', content: 'Un ID de reponses doit etre fourni.'])
          return
        }
        def eevAnswers = EEVAnswers.get(Integer.parseInt(params.id))
        if(!eevAnswers){
          response.status = 404
          respond([type: 'danger', content: "Aucun ensemble de reponses ne correspond a cet identifiant: ${params.id}"])
          return
        }
        JSON.use('deep'){
          def result = [:]
          eevAnswers.answers.each{
            result[it.question.id.intValue()] = it.answer
          }
          respond([eev: eevAnswers.eevQuestions, interviewee: eevAnswers.interviewee, interviewer: eevAnswers.interviewer, answers: result])
        }
      }
      '*'{
        response.status = 404
        respond([type: 'danger', content: "Only JSON allowed"])
      }
    }
  }
}
