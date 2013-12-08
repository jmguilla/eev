package com.jmguilla.eev

class EEVRow extends Content{

  Question question
  Answer answer
  
  static mapping = {
    question cascade: 'none'
    answer cascade: 'none'
  }

  static constraints = { importFrom Content }
}
