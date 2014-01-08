package com.jmguilla.eev

class Answer {

  Date date = new Date()

  static belongsTo = [question: Question, eev: EEVAnswers]

  static mapping = {
  }

  static constraints = {
  }
  
  static fetchMode = [question: 'eager']
}
