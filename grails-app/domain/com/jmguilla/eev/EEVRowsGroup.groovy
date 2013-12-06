package com.jmguilla.eev

class EEVRowsGroup implements Serializable{

  String title

  static hasMany = [rows: EEVRow]

  static constraints = { rows(nullable: true) }
}
