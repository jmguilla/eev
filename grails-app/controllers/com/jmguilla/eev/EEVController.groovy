package com.jmguilla.eev



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.codehaus.groovy.grails.web.json.JSONObject

@Transactional(readOnly = true)
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
    fillImpl(request, response, params, new EEV(request.JSON))
  }

  def edit(){
    def eev = EEV.get(params.id)
    if(!eev || eev.template){
      response.sendError(404)
    }
    fillImpl(request, response, params, eev)
  }

  def protected fillImpl(request, response, params, EEV eev){
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
          bindEEV(eev, request.JSON)
          eev.template = false
          result['type'] = 'success'
          result['content'] ='<strong>Nouvel EEV cree</strong>'
          eev = eev.save(failOnError: true, flush: true)
          result['model'] = ['eev': eev]
        }catch(Throwable t){
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

  protected void bindEEV(EEV eev, JSONObject input){
    //TODO switch to services
    bindData(eev, input)
    for(group in input.groups){
      def newGroup = (eev.id?EEVRowsGroup.get(group.id): new EEVRowsGroup(group))
      bindData(newGroup, group)
      newGroup = newGroup.save(failOnError: true)
      for(row in group.rows){
        def newRow = (eev.id?EEVRow.get(row.id):new EEVRow(row))
        bindData(newRow, row)
        newRow.group = newGroup
        def newQuestionClass = grailsApplication.getDomainClass(row.question.class).clazz
        def newQuestion = (eev.id?newQuestionClass.get(row.question.id): newQuestionClass.newInstance())
        bindData(newQuestion, row.question)
        def newAnswerClass = grailsApplication.getDomainClass(row.answer.class).clazz
        def newAnswer = (eev.id?newAnswerClass.get(row.answer.id): newAnswerClass.newInstance())
        bindData(newAnswer, row.answer)
        newRow.question = newQuestion.save(failOnError: true)
        newRow.answer = newAnswer.save(failOnError: true)
        newGroup.addToRows(newRow.save(failOnError: true))
      }
      newGroup = newGroup.save(failOnError: true)
      eev.addToGroups(newGroup)
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
}
