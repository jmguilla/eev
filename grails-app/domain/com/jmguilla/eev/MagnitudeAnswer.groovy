package com.jmguilla.eev

class MagnitudeAnswer extends Answer{

  Integer answer = new Integer(-1)

  static constraints = {
    importFrom Answer
    answer(nullable: false, min: -1, max:3)
  }

  static mapping = {
    answer defaultValue: new Integer(-1)
  }

  def MagnitudeAnswer(String value){
    this.answer = Integer.parseInt(value)
  }
}
