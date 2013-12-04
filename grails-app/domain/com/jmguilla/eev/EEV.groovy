package com.jmguilla.eev

class EEV {

  String title
  User interviewer, interviewee
  Boolean template = true

  static hasMany = [groups: EEVRowsGroup]

  static constraints = {
    interviewer(nullable: true)
    interviewee(nullable: true)
    groups(nullable: true)
  }
}
