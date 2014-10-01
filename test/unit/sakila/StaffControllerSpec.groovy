package sakila


import grails.test.mixin.*
import spock.lang.*

@TestFor(StaffController)
@Mock(Staff)
class StaffControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.staffInstanceList
        model.staffInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.staffInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def staff = new Staff()
        staff.validate()
        controller.save(staff)

        then: "The create view is rendered again with the correct model"
        model.staffInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        staff = new Staff(params)

        controller.save(staff)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/staff/show/1'
        controller.flash.message != null
        Staff.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def staff = new Staff(params)
        controller.show(staff)

        then: "A model is populated containing the domain instance"
        model.staffInstance == staff
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def staff = new Staff(params)
        controller.edit(staff)

        then: "A model is populated containing the domain instance"
        model.staffInstance == staff
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/staff/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def staff = new Staff()
        staff.validate()
        controller.update(staff)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.staffInstance == staff

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        staff = new Staff(params).save(flush: true)
        controller.update(staff)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/staff/show/$staff.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/staff/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def staff = new Staff(params).save(flush: true)

        then: "It exists"
        Staff.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(staff)

        then: "The instance is deleted"
        Staff.count() == 0
        response.redirectedUrl == '/staff/index'
        flash.message != null
    }
}
