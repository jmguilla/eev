package com.jmguilla.eev

import grails.plugins.jsonapis.JsonApi

class EEVQuestions {

  @JsonApi('answersList')
  String title

  static hasMany = [contents: Content]

  static constraints = {
    title(nullable: true)
    contents(nullable: true)
  }
}
