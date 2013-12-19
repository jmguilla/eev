package com.jmguilla.eev

class User {

  transient springSecurityService

  String username
  String password
  String email
  boolean enabled = true
  boolean accountExpired
  boolean accountLocked
  boolean passwordExpired

  static transients = ['springSecurityService']

  static constraints = {
    username blank: false, unique: true
    password blank: false
    email nullable: false, blank: false, unique: true
  }

  static mapping = { password column: 'password' }

  Set<Role> getAuthorities() {
    UserRole.findAllByUser(this).collect { it.role } as Set
  }

  def beforeInsert() {
    encodePassword()
  }

  def beforeUpdate() {
    if (isDirty('password')) {
      encodePassword()
    }
  }

  protected void encodePassword() {
    password = springSecurityService.encodePassword(password)
  }
}
