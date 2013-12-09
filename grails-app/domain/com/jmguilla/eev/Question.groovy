package com.jmguilla.eev

class Question {

  String question

  String answerType

  static belongsTo = [row: EEVRow]

  static constraints = {
    answerType(nullable: false, blank: false)
  }
}