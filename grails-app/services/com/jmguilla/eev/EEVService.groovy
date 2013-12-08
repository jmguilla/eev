package com.jmguilla.eev

import grails.transaction.Transactional

import org.springframework.transaction.annotation.Propagation

class EEVService {

  @Transactional(propagation = Propagation.REQUIRES_NEW)
  def serviceMethod() {
  }
}
