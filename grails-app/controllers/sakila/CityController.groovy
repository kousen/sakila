package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond City.list(params), model: [cityInstanceCount: City.count()]
    }

    def show(City cityInstance) {
        respond cityInstance
    }

    def create() {
        respond new City(params)
    }

    @Transactional
    def save(City cityInstance) {
        if (cityInstance == null) {
            notFound()
            return
        }

        if (cityInstance.hasErrors()) {
            respond cityInstance.errors, view: 'create'
            return
        }

        cityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'city.label', default: 'City'), cityInstance.id])
                redirect cityInstance
            }
            '*' { respond cityInstance, [status: CREATED] }
        }
    }

    def edit(City cityInstance) {
        respond cityInstance
    }

    @Transactional
    def update(City cityInstance) {
        if (cityInstance == null) {
            notFound()
            return
        }

        if (cityInstance.hasErrors()) {
            respond cityInstance.errors, view: 'edit'
            return
        }

        cityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'City.label', default: 'City'), cityInstance.id])
                redirect cityInstance
            }
            '*' { respond cityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(City cityInstance) {

        if (cityInstance == null) {
            notFound()
            return
        }

        cityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'City.label', default: 'City'), cityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'city.label', default: 'City'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
