package com.jmguilla.eev

class EEVRowsGroup extends Content implements Serializable{

  String title

  static hasMany = [contents: Content]

  static mapping = { contents cascade: 'none' }

  static constraints = {
    importFrom Content
    contents(nullable: true)
  }
}
