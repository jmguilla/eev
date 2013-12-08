package com.jmguilla.eev

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.codehaus.groovy.grails.web.json.JSONObject

class EEVController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def getTemplate(){
    if(!request.method.equalsIgnoreCase('get')){
      response.sendError(303)
    }
    def eev = EEV.get(params.id)
    if(!eev){
      response.sendError(404)
    }
    if(!eev.template){
      response.sendError(400)
    }
    withFormat{
      json{
        JSON.use('deep'){ render (eev as JSON) }
      }
      '*'{ response.sendError(305) }
    }
  }

  def get(){
    if(!request.method.equalsIgnoreCase('get')){
      response.sendError(303)
    }
    def eev = EEV.get(params.id)
    if(!eev){
      response.sendError(404)
    }
    if(eev.template){
      response.sendError(400)
    }
    withFormat{
      json{
        JSON.use('deep'){ render (eev as JSON) }
      }
      '*'{ response.sendError(305) }
    }
  }

  def answer(){
    fillImpl(request, response, params, new EEV(), false)
  }

  def edit(){
    def eev = EEV.get(params.id)
    if(!eev || eev.template){
      response.sendError(404)
    }
    fillImpl(request, response, params, eev, true)
  }

  def protected fillImpl(request, response, params, EEV eev, boolean update){
    withFormat{
      html{
        if(!params.id){
          response.sendError(404)
        }
        render view: 'fill', model: [params: params]
      }
      json{
        def result = [:]
        if(!request.post){
          response.sendError(303)
        }
        try{
          bindEEV(eev, request.JSON, update)
          eev.template = false
          result['type'] = 'success'
          result['content'] ='<strong>Nouvel EEV cree</strong>'
          result['model'] = ['eev': eev]
          eev = eev.save(failOnError: true, flush: true)
        }catch(Throwable t){
          log.error('Cannot answer the eev', t)
          response.status = 500
          result['type'] = 'danger'
          result['content'] = t.toString()
        }
        JSON.use('deep'){ render(result as JSON) }
      }
      '*'{ response.sendError(305) }
    }
  }

  def show(){
    def eev = EEV.get(params.id)
    if(!eev){
      response.sendError(404)
    }
    render view: 'show', model: [eevInstance: eev]
  }

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond EEV.list(params), model:[EEVInstanceCount: EEV.count()]
  }

  def create() {
    respond new EEV(params)
  }

  @Transactional
  def update(EEV EEVInstance) {
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
  def delete(EEV EEVInstance) {

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

  protected void bindEEV(EEV eev, JSONObject input, boolean update){
    //TODO switch to services
    bindData(eev, input)
    for(group in input.contents){
      def newGroup = (update?EEVRowsGroup.get(group.id): new EEVRowsGroup(group))
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
  
  def bindGroup(update, newGroup, group){
    bindData(newGroup, group)
    newGroup = newGroup.save(failOnError: true)
    for(content in group.contents){
      def newContent = null
      if(content.contents){
        newContent = (update?EEVRowsGroup.get(group.id): new EEVRowsGroup(content))
        bindGroup(update, newContent, content)
      }else{
        newContent = (update?EEVRow.get(content.id):new EEVRow(content))
        bindRow(update, newContent, content)
      }
      newGroup.addToContents(newContent.save(failOnError: true))
    }
  }
  
  def bindRow(update, newRow, content){
    bindData(newRow, content)
    def newQuestionClass = grailsApplication.getDomainClass(content.question.class).clazz
    def newQuestion = (update?newQuestionClass.get(content.question.id): newQuestionClass.newInstance())
    bindData(newQuestion, content.question)
    def newAnswerClass = grailsApplication.getDomainClass(content.answer.class).clazz
    def newAnswer = (update?newAnswerClass.get(content.answer.id): newAnswerClass.newInstance())
    bindData(newAnswer, content.answer)
    newRow.question = newQuestion.save(failOnError: true)
    newRow.answer = newAnswer.save(failOnError: true)
  }
}
