package com.jmguilla.eev

class EEVRowsGroup extends Content implements Serializable{

  String title
  EEVRow strengthsQuestion
  EEVRow weaknessesQuestion

  FreeTextAnswer strengths
  FreeTextAnswer weaknesses

  static hasMany = [contents: Content]

  static mapping = {
    strengthsQuestion casscade: 'all'
    weaknessesQuestion casscade: 'all'
    contents cascade: 'none'
  }

  static constraints = {
    importFrom Content
    contents(nullable: true)
    strengths(nullable: true)
    weaknesses(nullable: true)
  }

  def beforeValidate(){
    if(!strengthsQuestion){
      strengthsQuestion = new EEVRow(rank: -1, question: new Question(answerType: FreeTextAnswer.name, question: "Points Forts")).save(failOnError: true)
    }
    if(!weaknessesQuestion){
      weaknessesQuestion = new EEVRow(rank: -1, question: new Question(answerType: FreeTextAnswer.name, question: "Points Faibles")).save(failOnError: true)
    }
  }
}
