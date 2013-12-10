package com.jmguilla.eev

import grails.converters.JSON
import grails.transaction.Transactional

class EEVAnswersController {

  def EEVQuestionsService
  def EEVAnswersService

  @Transactional
  def answer() {
    withFormat{
      json{
        def eevQuestions = EEVQuestions.get(request.JSON.eevId)
        if(!eevQuestions){
          respond([type: "danger", content: "Aucun EEV ne correspond a l'identifiant: ${request.JSON.eevId}"])
          return
        }
        def eevAnswers = new EEVAnswers(eevQuestions: eevQuestions, interviewer: (request.JSON.interviewer?request.JSON.interviewer: null), interviewee: (request.JSON.interviewee?request.JSON.interviewee: null)).save(failOnError: true)
        def answers = request.JSON.answers
        def questions = Question.findAll("from Question as q where q.id in (:ids)", [ids: answers.collect{k, v -> Long.parseLong(k)}])
        answers.each{qid, value ->
          def question = questions.find{q -> q.id == Long.parseLong(qid)}
          def answer = new MagnitudeAnswer(question: question,
          eev: eevAnswers,
          answer: Integer.parseInt(value)).save(failOnError: true)
        }
        JSON.use('deep'){
          respond([type: "success", content: "EEV repondu avec succes", model:[eev: eevQuestions]])
        }
      }
      '*'{
        response.status = 400
        respond([type: "danger", content:"Only json method is allowed for creation."])
      }
    }
  }

  @Transactional
  def edit(){
    withFormat{
      html{
        if(!params.id){
          response.sendError(404)
        }
        render view: 'edit', model: [params: params]
      }
      json{
      }
      '*'{
        response.status = 400
        respond([type: "danger", content:"Only html / json method are allowed for edition."])
      }
    }
  }

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
          def result = []
          eevAnswers.answers.each{result[it.question.id.intValue()] = it.answer}
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
