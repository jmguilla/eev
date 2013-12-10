package com.jmguilla.eev

class EEVAnswers {

  String interviewer, interviewee

  static belongsTo = [eevQuestions: EEVQuestions]

  static hasMany = [answers: Answer]

  static constraints = {
    interviewer(nullable: true)
    interviewee(nullable: true)
    answers(nullable: true)
  }
}
