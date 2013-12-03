package com.jmguilla.eev



import grails.test.mixin.*
import spock.lang.*

@TestFor(EEVController)
@Mock(EEV)
class EEVControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.EEVInstanceList
            model.EEVInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.EEVInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def EEV = new EEV()
            EEV.validate()
            controller.save(EEV)

        then:"The create view is rendered again with the correct model"
            model.EEVInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            EEV = new EEV(params)

            controller.save(EEV)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/EEV/show/1'
            controller.flash.message != null
            EEV.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def EEV = new EEV(params)
            controller.show(EEV)

        then:"A model is populated containing the domain instance"
            model.EEVInstance == EEV
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def EEV = new EEV(params)
            controller.edit(EEV)

        then:"A model is populated containing the domain instance"
            model.EEVInstance == EEV
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/EEV/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def EEV = new EEV()
            EEV.validate()
            controller.update(EEV)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.EEVInstance == EEV

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            EEV = new EEV(params).save(flush: true)
            controller.update(EEV)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/EEV/show/$EEV.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/EEV/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def EEV = new EEV(params).save(flush: true)

        then:"It exists"
            EEV.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(EEV)

        then:"The instance is deleted"
            EEV.count() == 0
            response.redirectedUrl == '/EEV/index'
            flash.message != null
    }
}
