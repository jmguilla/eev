package com.jmguilla.eev

class User {

  String email

  static constraints = {
  }

  static mapping = { id name: 'email', generator: 'assigned' }
}
