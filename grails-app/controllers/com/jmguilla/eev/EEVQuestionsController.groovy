package com.jmguilla.eev

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import javax.annotation.security.PermitAll

import org.codehaus.groovy.grails.web.json.JSONObject

class EEVQuestionsController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  @PermitAll
  def get(){
    if(!request.method.equalsIgnoreCase('get')){
      response.sendError(303)
    }
    def eev = EEVQuestions.get(params.id)
    if(!eev){
      response.sendError(404)
    }
    withFormat{
      json{
        JSON.use('deep'){ render (eev as JSON) }
      }
      '*'{ response.sendError(305) }
    }
  }

  @PermitAll
  def show(){
    if(!params.id){
      response.sendError(404)
    }
    respond new Object(), [view: 'fill', model: [params: params, eevInstance: [id: params.id]]]
  }

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond EEVQuestions.list(params), model:[EEVInstanceCount: EEVQuestions.count()]
  }

  def create() {
    respond new EEVQuestions(params)
  }

  @Transactional
  def update(EEVQuestions EEVInstance) {
    if (EEVInstance == null) {
      notFound()
      return
    }

    if (EEVInstance.hasErrors()) {
      respond EEVInstance.errors, view:'edit'
      return
    }

    EEVInstance.save flush:true

    request.withFormat {
      form {
        flash.message = message(code: 'default.updated.message', args: [
          message(code: 'EEV.label', default: 'EEV'),
          EEVInstance.id
        ])
        redirect EEVInstance
      }
      '*'{
        respond EEVInstance, [status: OK]
      }
    }
  }

  @Transactional
  def delete(EEVQuestions EEVInstance) {

    if (EEVInstance == null) {
      notFound()
      return
    }

    EEVInstance.delete flush:true

    request.withFormat {
      form {
        flash.message = message(code: 'default.deleted.message', args: [
          message(code: 'EEV.label', default: 'EEV'),
          EEVInstance.id
        ])
        redirect action:"index", method:"GET"
      }
      '*'{ render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form {
        flash.message = message(code: 'default.not.found.message', args: [
          message(code: 'EEVInstance.label', default: 'EEV'),
          params.id
        ])
        redirect action: "index", method: "GET"
      }
      '*'{ render status: NOT_FOUND }
    }
  }

  protected void bindEEV(EEVQuestions eev, JSONObject input, boolean update){
    //TODO switch to services
    bindData(eev, input)
    for(group in input.contents){
      def newGroup = (update?EEVRowsGroup.get(group.id): new EEVRowsGroup())
      bindGroup(update, newGroup, group)
      eev.addToContents(newGroup.save(failOnError: true))
    }
    def interviewee = User.findByEmailIlike(input.interviewee.email)
    if(!interviewee){
      interviewee = new User()
      interviewee.email = input.interviewee.email
      interviewee = interviewee.save(failOnError: true)
    }
    eev.interviewee = interviewee
    def interviewer = User.findByEmailIlike(input.interviewer.email)
    if(!interviewer){
      interviewer = new User()
      interviewer.email = input.interviewer.email
      interviewer = interviewer.save(failOnError: true)
    }
    eev.interviewer = interviewer
  }

  def bindGroup(boolean update, EEVRowsGroup newGroup, JSONObject group){
    bindData(newGroup, group)
    for(content in group.contents){
      def newContent = null
      if(content.contents){
        newContent = (update?EEVRowsGroup.get(content.id): new EEVRowsGroup())
        bindGroup(update, newContent, content)
      }else{
        newContent = (update?EEVRow.get(content.id):new EEVRow())
        bindRow(update, newContent, content)
      }
      newGroup.addToContents(newContent.save(failOnError: true))
    }
  }

  def bindRow(boolean update, EEVRow newRow, JSONObject content){
    def newQuestionClass = grailsApplication.getDomainClass(content.question.class).clazz
    def newQuestion = (update?newQuestionClass.get(content.question.id): newQuestionClass.newInstance())
    def newAnswerClass = grailsApplication.getDomainClass(content.answer.class).clazz
    def newAnswer = (update?newAnswerClass.get(content.answer.id): newAnswerClass.newInstance())
    newAnswer.answer = new Integer(content.answer.answer)
    newQuestion.question = content.question.question
    newRow.rank = content.rank
    newRow.question = newQuestion.save(failOnError: true)
    newRow.answer = newAnswer.save(failOnError: true)
  }
}
