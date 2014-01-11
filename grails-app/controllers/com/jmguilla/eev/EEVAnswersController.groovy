package com.jmguilla.eev

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


class EEVAnswersController {

  def EEVQuestionsService
  def EEVAnswersServicelean

  @Transactional(readOnly = true)
  @Secured(['ROLE_ADMIN'])
  def list(){
    withFormat{
      html{
      }
      json{
        def result = EEVAnswers.executeQuery('select a from EEVAnswers a inner join fetch a.eevQuestions as eevQuestions order by eevQuestions.id, a.creationDate')
        JSON.use('answersList'){ render(result as JSON) }
      }
    }
  }

  def listOffline(){
    render([] as JSON)
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
//        renderPdf(template: "pdf", model: [eev: eev], filename: "eev-${eev.id}")
          render(view: "_pdf", model: [eev: eev], filename: "eev-${eev.id}")
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
