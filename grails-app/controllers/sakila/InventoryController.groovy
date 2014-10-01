package sakila


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InventoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Inventory.list(params), model: [inventoryInstanceCount: Inventory.count()]
    }

    def show(Inventory inventoryInstance) {
        respond inventoryInstance
    }

    def create() {
        respond new Inventory(params)
    }

    @Transactional
    def save(Inventory inventoryInstance) {
        if (inventoryInstance == null) {
            notFound()
            return
        }

        if (inventoryInstance.hasErrors()) {
            respond inventoryInstance.errors, view: 'create'
            return
        }

        inventoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inventory.label', default: 'Inventory'), inventoryInstance.id])
                redirect inventoryInstance
            }
            '*' { respond inventoryInstance, [status: CREATED] }
        }
    }

    def edit(Inventory inventoryInstance) {
        respond inventoryInstance
    }

    @Transactional
    def update(Inventory inventoryInstance) {
        if (inventoryInstance == null) {
            notFound()
            return
        }

        if (inventoryInstance.hasErrors()) {
            respond inventoryInstance.errors, view: 'edit'
            return
        }

        inventoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Inventory.label', default: 'Inventory'), inventoryInstance.id])
                redirect inventoryInstance
            }
            '*' { respond inventoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Inventory inventoryInstance) {

        if (inventoryInstance == null) {
            notFound()
            return
        }

        inventoryInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Inventory.label', default: 'Inventory'), inventoryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventory.label', default: 'Inventory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
