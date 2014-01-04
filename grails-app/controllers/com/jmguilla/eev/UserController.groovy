package com.jmguilla.eev

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class UserController {

  def springSecurityService
  def saltSource

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
    render(result as JSON)
  }

  def account(){
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def updatePWD(){
    def current = request.JSON.current
    def newPWD = request.JSON.newPWD
    def newPWDAgain = request.JSON.newPWDAgain
    if(!current || !newPWD || !newPWDAgain){
      response.status = 400
      render([type: 'danger', content: 'Tous les parametres sont requis'] as JSON)
      return
    }
    if(!newPWD.equals(newPWDAgain)){
      response.status = 400
      render([type: 'danger', content: 'La confirmation ne correspond pas.'] as JSON)
      return
    }
    def user = springSecurityService.getCurrentUser()
    def userDetails = springSecurityService.userDetailsService.loadUserByUsername(user.username)
    def salt = saltSource.getSalt(userDetails)
    if(!springSecurityService.passwordEncoder.isPasswordValid(userDetails.password, current, salt)){
      response.status = 400
      render([type: 'danger', content: 'Votre password n\'est pas correct.'] as JSON)
      return
    }
    user.password = newPWD
    user.save(failOnError: true)
    render([type: 'success', content: 'Votre password a &eacute;t&eacute; chang&eacute;'] as JSON)
  }
}
