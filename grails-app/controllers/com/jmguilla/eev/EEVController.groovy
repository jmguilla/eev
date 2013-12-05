package com.jmguilla.eev



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

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
    withFormat{
      html{
        if(!params.id){
          response.sendError(404)
        }
        render view: 'answer', model: [params: params]
      }
      json{
        def result = [:]
        if(!request.post){
          response.sendError(303)
        }
        try{
          def eev = new EEV(request.JSON)
          bindData(eev, request.JSON)
          eev.template = false
          eev.id = null
          result['type'] = 'success'
          result['content'] ='Nouveau EEV cree'
          eev = eev.save(failOnError: true, flush: true)
          result['model'] = ['eev': eev]
        }catch(Throwable t){
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

  def edit(EEV EEVInstance) {
    respond EEVInstance
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
}
