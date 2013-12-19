package com.jmguilla.eev

import grails.converters.JSON

class UserController {

  def springSecurityService

  def index() {
  }

  def widgets() {
    def result = [:]
    def user = null
    if(springSecurityService.isLoggedIn()){
      user = springSecurityService.getCurrentUser()
    }
    result.nav = g.render(template: "nav", model: [userInstance: user])
    render(result as JSON)
  }

  def widgetsOffline(){
    def result = [:]
    result.nav = g.render(template: "nav_offline")
  }
}
