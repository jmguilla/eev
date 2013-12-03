package com.jmguilla.eev

class MagnitudeAnswer extends Answer{

  Integer level
  static constraints = {
    importFrom Answer
    level(nullable: false, min: 0, max:3)
  }
}
