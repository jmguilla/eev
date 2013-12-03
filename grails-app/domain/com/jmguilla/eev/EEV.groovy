package com.jmguilla.eev

class EEV {

  String title
  User owner, interviewee
  
  static hasMany = [groups: EEVRowsGroup]

  static constraints = {
    owner(nullable: true)
    interviewee(nullable: true)
    groups(nullable: true)
  }
}
