package com.jmguilla.eev

import grails.plugins.jsonapis.JsonApi

class EEVAnswers {

  @JsonApi('answersList')
  String interviewer
  @JsonApi('answersList')
  String interviewee
  @JsonApi('answersList')
  Date creationDate = new Date()
  @JsonApi('answersList')
  EEVQuestions eevQuestions

  static belongsTo = [eevQuestions: EEVQuestions]

  static hasMany = [answers: Answer]

  static fetchMode = [eevQuestions: 'eager']

  static marshalling={
    json{
      answerslist{
        shouldOutputIdentifier false
        shouldOutputVersion false
        shouldOutputClass false
      }
    }
  }


  static constraints = {
    interviewer(nullable: true)
    interviewee(nullable: true)
    answers(nullable: true)
    creationDate(nullable: false)
  }
}
