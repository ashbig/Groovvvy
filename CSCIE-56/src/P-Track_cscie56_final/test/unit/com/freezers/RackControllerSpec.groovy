package com.freezers



import grails.test.mixin.*
import spock.lang.*

@TestFor(RackController)
@Mock(Rack)
class RackControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["name"] = 'name'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.rackInstanceList
            model.rackInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.rackInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        /*when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def rack = new Rack()
            rack.validate()
            controller.save(rack)

        then:"The create view is rendered again with the correct model"
            model.rackInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            rack = new Rack(params)

            controller.save(rack)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/rack/show/1'
            controller.flash.message != null
            Rack.count() == 1
         */
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def rack = new Rack(params)
            controller.show(rack)

        then:"A model is populated containing the domain instance"
            model.rackInstance == rack
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def rack = new Rack(params)
            controller.edit(rack)

        then:"A model is populated containing the domain instance"
            model.rackInstance == rack
    }

    /*void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/rack/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def rack = new Rack()
            rack.validate()
            controller.update(rack)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.rackInstance == rack

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            rack = new Rack(params).save(flush: true)
            controller.update(rack)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/rack/show/$rack.id"
            flash.message != null
    }

   /* void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/rack/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def rack = new Rack(params).save(flush: true)

        then:"It exists"
            Rack.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(rack)

        then:"The instance is deleted"
            Rack.count() == 0
            response.redirectedUrl == '/rack/index'
            flash.message != null
    }*/
}
