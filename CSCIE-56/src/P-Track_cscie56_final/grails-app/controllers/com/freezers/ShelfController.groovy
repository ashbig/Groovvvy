package com.freezers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ShelfController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def shelfService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Shelf.list(params), model:[shelfInstanceCount: Shelf.count()]
    }

    def show(Shelf shelfInstance) {
        respond shelfInstance
    }

    def create() {
        respond new Shelf(params)
    }

    def save(Shelf shelfInstance) {
        if (shelfInstance == null) {
            notFound()
            return
        }

        if (shelfInstance.hasErrors()) {
            respond shelfInstance.errors, view:'create'
            return
        }

        shelfService.save(shelfInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shelf.label', default: 'Shelf'), shelfInstance.id])
                redirect shelfInstance
            }
            '*' { respond shelfInstance, [status: CREATED] }
        }
    }

    def edit(Shelf shelfInstance) {
        respond shelfInstance
    }

    def update(Shelf shelfInstance) {
        if (shelfInstance == null) {
            notFound()
            return
        }

        if (shelfInstance.hasErrors()) {
            respond shelfInstance.errors, view:'edit'
            return
        }

        shelfService.save(shelfInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Shelf.label', default: 'Shelf'), shelfInstance.id])
                redirect shelfInstance
            }
            '*'{ respond shelfInstance, [status: OK] }
        }
    }

    def delete(Shelf shelfInstance) {

        if (shelfInstance == null) {
            notFound()
            return
        }

        shelfService.delete(shelfInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Shelf.label', default: 'Shelf'), shelfInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelf.label', default: 'Shelf'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
