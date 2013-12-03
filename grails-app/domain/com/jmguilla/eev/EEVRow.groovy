package com.jmguilla.eev

class EEVRow {

  Integer rank
  Question question
  Answer answer

  static belongsTo = [eevGroup: EEVRowsGroup]
  
  static constraints = {
    answer(nullable: true)
  }
}
