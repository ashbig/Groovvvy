package com.freezers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class RackController {

    def rackService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rack.list(params), model:[rackInstanceCount: Rack.count()]
    }

    def show(Rack rackInstance) {
        respond rackInstance
    }

    def create() {
        respond new Rack(params)
    }

    def save(Rack rackInstance) {
        if (rackInstance == null) {
            notFound()
            return
        }

        if (rackInstance.hasErrors()) {
            respond rackInstance.errors, view:'create'
            return
        }

        rackService.save(rackInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rack.label', default: 'Rack'), rackInstance.id])
                redirect rackInstance
            }
            '*' { respond rackInstance, [status: CREATED] }
        }
    }

    def edit(Rack rackInstance) {
        respond rackInstance
    }

    def update(Rack rackInstance) {
        if (rackInstance == null) {
            notFound()
            return
        }

        if (rackInstance.hasErrors()) {
            respond rackInstance.errors, view:'edit'
            return
        }

        rackService.save(rackInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Rack.label', default: 'Rack'), rackInstance.id])
                redirect rackInstance
            }
            '*'{ respond rackInstance, [status: OK] }
        }
    }

    def delete(Rack rackInstance) {

        if (rackInstance == null) {
            notFound()
            return
        }

        rackService.delete(rackInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Rack.label', default: 'Rack'), rackInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rack.label', default: 'Rack'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
