package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LanguageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Language.list(params), model: [languageInstanceCount: Language.count()]
    }

    def show(Language languageInstance) {
        respond languageInstance
    }

    def create() {
        respond new Language(params)
    }

    @Transactional
    def save(Language languageInstance) {
        if (languageInstance == null) {
            notFound()
            return
        }

        if (languageInstance.hasErrors()) {
            respond languageInstance.errors, view: 'create'
            return
        }

        languageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'language.label', default: 'Language'), languageInstance.id])
                redirect languageInstance
            }
            '*' { respond languageInstance, [status: CREATED] }
        }
    }

    def edit(Language languageInstance) {
        respond languageInstance
    }

    @Transactional
    def update(Language languageInstance) {
        if (languageInstance == null) {
            notFound()
            return
        }

        if (languageInstance.hasErrors()) {
            respond languageInstance.errors, view: 'edit'
            return
        }

        languageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Language.label', default: 'Language'), languageInstance.id])
                redirect languageInstance
            }
            '*' { respond languageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Language languageInstance) {

        if (languageInstance == null) {
            notFound()
            return
        }

        languageInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Language.label', default: 'Language'), languageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'language.label', default: 'Language'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
