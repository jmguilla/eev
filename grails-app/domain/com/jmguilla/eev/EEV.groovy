package com.jmguilla.eev

class EEV {

  String title
  User interviewer, interviewee
  Boolean template = Boolean.TRUE
  
  static hasMany = [contents: Content]

  static mapping = { contents cascade: 'none' }

  static constraints = {
    title(nullable: true)
    contents(nullable: true)
    interviewer(nullable: true)
    interviewee(nullable: true)
  }
}
