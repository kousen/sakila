package sakila


import grails.test.mixin.*
import spock.lang.*

@TestFor(CountryController)
@Mock(Country)
class CountryControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        params.name = 'Antarctica'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.countryInstanceList
        model.countryInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.countryInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def country = new Country()
        country.validate()
        controller.save(country)

        then: "The create view is rendered again with the correct model"
        model.countryInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        country = new Country(params)

        controller.save(country)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/country/show/1'
        controller.flash.message != null
        Country.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def country = new Country(params)
        controller.show(country)

        then: "A model is populated containing the domain instance"
        model.countryInstance == country
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def country = new Country(params)
        controller.edit(country)

        then: "A model is populated containing the domain instance"
        model.countryInstance == country
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/country/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def country = new Country()
        country.validate()
        controller.update(country)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.countryInstance == country

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        country = new Country(params).save(flush: true)
        controller.update(country)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/country/show/$country.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/country/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def country = new Country(params).save(flush: true)

        then: "It exists"
        Country.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(country)

        then: "The instance is deleted"
        Country.count() == 0
        response.redirectedUrl == '/country/index'
        flash.message != null
    }
}
