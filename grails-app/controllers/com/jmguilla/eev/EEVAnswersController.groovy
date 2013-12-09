package com.jmguilla.eev

import grails.transaction.Transactional

class EEVAnswersController {

  @Transactional
  def answer() {
    withFormat{
      json{
        def eevAnswers = new EEVAnswers(interviewer: (request.JSON.interviewer?request.JSON.interviewer: null), interviewee: (request.JSON.interviewee?request.JSON.interviewee: null)).save(failOnError: true)
        def answers = request.JSON.answers
        def questions = Question.findAll("from Question as q where q.id in (:ids)", [ids: answers.collect{k, v -> Long.parseLong(k)}])
        answers.each{qid, value ->
          println "$qid -> $value"
          def question = questions.find{q -> q.id == Long.parseLong(qid)}
          def answer = new MagnitudeAnswer(question: question,
          eev: eevAnswers,
          answer: Integer.parseInt(value)).save(failOnError: true)
        }
        render([type: "success", content: "EEV repondu avec succes"])
      }
      '*'{
        response.status = 400
        render([type: "danger", content:"Only json method is allowed for creation."])
      }
    }
  }
}
