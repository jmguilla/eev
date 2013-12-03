package com.jmguilla.eev

class EEVRowsGroup {

  String title

  static hasMany = [rows: EEVRow]

  static constraints = {
    rows(nullable: true)
  }
}
