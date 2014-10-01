package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Actor.list(params), model: [actorInstanceCount: Actor.count()]
    }

    def show(Actor actorInstance) {
        respond actorInstance
    }

    def create() {
        respond new Actor(params)
    }

    @Transactional
    def save(Actor actorInstance) {
        if (actorInstance == null) {
            notFound()
            return
        }

        if (actorInstance.hasErrors()) {
            respond actorInstance.errors, view: 'create'
            return
        }

        actorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'actor.label', default: 'Actor'), actorInstance.id])
                redirect actorInstance
            }
            '*' { respond actorInstance, [status: CREATED] }
        }
    }

    def edit(Actor actorInstance) {
        respond actorInstance
    }

    @Transactional
    def update(Actor actorInstance) {
        if (actorInstance == null) {
            notFound()
            return
        }

        if (actorInstance.hasErrors()) {
            respond actorInstance.errors, view: 'edit'
            return
        }

        actorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Actor.label', default: 'Actor'), actorInstance.id])
                redirect actorInstance
            }
            '*' { respond actorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Actor actorInstance) {

        if (actorInstance == null) {
            notFound()
            return
        }

        actorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Actor.label', default: 'Actor'), actorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
