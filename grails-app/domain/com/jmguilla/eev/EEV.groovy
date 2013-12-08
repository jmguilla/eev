package com.jmguilla.eev

class EEV {

  String title
  User interviewer, interviewee
  Boolean template = Boolean.TRUE
  
  static hasMany = [contents: Content]

  static constraints = {
    contents(nullable: true)
  }
}
