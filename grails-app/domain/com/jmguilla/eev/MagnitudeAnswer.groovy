package com.jmguilla.eev

class MagnitudeAnswer extends Answer{

  Integer intAnswer = new Integer(-1)

  static constraints = {
    importFrom Answer
    intAnswer(nullable: true, min: -1, max:3)
  }

  static mapping = {
    intAnswer defaultValue: new Integer(-1)
  }

  def setAnswer(String value){
    this.intAnswer = Integer.parseInt(value)
  }

  def getAnswer(){
    if(intAnswer == null){
      return "-1"
    }
    return intAnswer.toString()
  }
}
