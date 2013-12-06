package com.jmguilla.eev

class EEVRow {

  Integer rank
  Question question
  Answer answer

  static belongsTo = [group: EEVRowsGroup]
  
  static constraints = {
  }
}
