package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FilmController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Film.list(params), model: [filmInstanceCount: Film.count()]
    }

    def show(Film filmInstance) {
        respond filmInstance
    }

    def create() {
        respond new Film(params)
    }

    @Transactional
    def save(Film filmInstance) {
        if (filmInstance == null) {
            notFound()
            return
        }

        if (filmInstance.hasErrors()) {
            respond filmInstance.errors, view: 'create'
            return
        }

        filmInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'film.label', default: 'Film'), filmInstance.id])
                redirect filmInstance
            }
            '*' { respond filmInstance, [status: CREATED] }
        }
    }

    def edit(Film filmInstance) {
        respond filmInstance
    }

    @Transactional
    def update(Film filmInstance) {
        if (filmInstance == null) {
            notFound()
            return
        }

        if (filmInstance.hasErrors()) {
            respond filmInstance.errors, view: 'edit'
            return
        }

        filmInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Film.label', default: 'Film'), filmInstance.id])
                redirect filmInstance
            }
            '*' { respond filmInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Film filmInstance) {

        if (filmInstance == null) {
            notFound()
            return
        }

        filmInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Film.label', default: 'Film'), filmInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'film.label', default: 'Film'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
