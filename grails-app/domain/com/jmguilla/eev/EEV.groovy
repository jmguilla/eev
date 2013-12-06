package com.jmguilla.eev

class EEV {

  String title
  User interviewer, interviewee
  Boolean template = Boolean.TRUE
  
  static hasMany = [groups: EEVRowsGroup]

  static constraints = {
    groups(nullable: true)
  }
}
