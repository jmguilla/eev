package com.jmguilla.eev

class Content {

  Integer rank

  static constraints = {
    rank(nullable: false, min: -1)
  }
}
