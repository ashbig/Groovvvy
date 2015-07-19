package com.freezers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class PlateController {

    def plateService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Plate.list(params), model:[plateInstanceCount: Plate.count()]
    }

    def show(Plate plateInstance) {
        respond plateInstance
    }

    def create() {
        respond new Plate(params)
    }

    def save(Plate plateInstance) {
        if (plateInstance == null) {
            notFound()
            return
        }

        if (plateInstance.hasErrors()) {
            respond plateInstance.errors, view:'create'
            return
        }

        plateService.save(plateInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.id])
                redirect plateInstance
            }
            '*' { respond plateInstance, [status: CREATED] }
        }
    }

    def edit(Plate plateInstance) {
        respond plateInstance
    }

    def update(Plate plateInstance) {
        if (plateInstance == null) {
            notFound()
            return
        }

        if (plateInstance.hasErrors()) {
            respond plateInstance.errors, view:'edit'
            return
        }

        plateService.save(plateInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Plate.label', default: 'Plate'), plateInstance.id])
                redirect plateInstance
            }
            '*'{ respond plateInstance, [status: OK] }
        }
    }

    def delete(Plate plateInstance) {

        if (plateInstance == null) {
            notFound()
            return
        }

        plateService.delete(plateInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Plate.label', default: 'Plate'), plateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
