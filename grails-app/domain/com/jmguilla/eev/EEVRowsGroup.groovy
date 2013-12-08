package com.jmguilla.eev

class EEVRowsGroup extends Content implements Serializable{

  String title

  static hasMany = [contents: Content]
  
  static constraints = {
    importFrom Content
    contents(nullable: true)
  }
}
