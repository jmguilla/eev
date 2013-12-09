package com.jmguilla.eev

class EEVQuestions {

  String title

  static hasMany = [contents: Content]

  static constraints = {
    title(nullable: true)
    contents(nullable: true)
  }
}
