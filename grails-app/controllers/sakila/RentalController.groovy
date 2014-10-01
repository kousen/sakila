package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RentalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rental.list(params), model: [rentalInstanceCount: Rental.count()]
    }

    def show(Rental rentalInstance) {
        respond rentalInstance
    }

    def create() {
        respond new Rental(params)
    }

    @Transactional
    def save(Rental rentalInstance) {
        if (rentalInstance == null) {
            notFound()
            return
        }

        if (rentalInstance.hasErrors()) {
            respond rentalInstance.errors, view: 'create'
            return
        }

        rentalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rental.label', default: 'Rental'), rentalInstance.id])
                redirect rentalInstance
            }
            '*' { respond rentalInstance, [status: CREATED] }
        }
    }

    def edit(Rental rentalInstance) {
        respond rentalInstance
    }

    @Transactional
    def update(Rental rentalInstance) {
        if (rentalInstance == null) {
            notFound()
            return
        }

        if (rentalInstance.hasErrors()) {
            respond rentalInstance.errors, view: 'edit'
            return
        }

        rentalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Rental.label', default: 'Rental'), rentalInstance.id])
                redirect rentalInstance
            }
            '*' { respond rentalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Rental rentalInstance) {

        if (rentalInstance == null) {
            notFound()
            return
        }

        rentalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Rental.label', default: 'Rental'), rentalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rental.label', default: 'Rental'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
