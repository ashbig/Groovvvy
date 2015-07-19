package com.freezers

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*

class FreezerController {

    def freezerService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        // for each of the shelves, then for each rack within the shelf
        // then for each plate in the rack do a case insensitive search
        // for the plate. the wildcard in the front and the back may
        // be slow in database, but for this purpose it should be sufficient
        respond Freezer.createCriteria().list (params) {
            if ( params.query ) {
                shelves {
                    racks {
                        plates {
                            ilike("name", "%${params.query}%")
                        }
                    }
                }
            }
        }, model:[freezerInstanceCount: Freezer.count()]
    }

    def show(Freezer freezerInstance) {
        respond freezerInstance
    }

    def create() {
        respond new Freezer(params)
    }

    def save(Freezer freezerInstance) {
        if (freezerInstance == null) {
            notFound()
            return
        }

        if (freezerInstance.hasErrors()) {
            respond freezerInstance.errors, view:'create'
            return
        }

        freezerService.save(freezerInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'freezer.label', default: 'Freezer'), freezerInstance.id])
                redirect freezerInstance
            }
            '*' { respond freezerInstance, [status: CREATED] }
        }
    }

    def edit(Freezer freezerInstance) {
        respond freezerInstance
    }

    def update(Freezer freezerInstance) {
        if (freezerInstance == null) {
            notFound()
            return
        }

        if (freezerInstance.hasErrors()) {
            respond freezerInstance.errors, view:'edit'
            return
        }

        freezerService.save(freezerInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Freezer.label', default: 'Freezer'), freezerInstance.id])
                redirect freezerInstance
            }
            '*'{ respond freezerInstance, [status: OK] }
        }
    }

    def delete(Freezer freezerInstance) {

        if (freezerInstance == null) {
            notFound()
            return
        }

        freezerService.delete(freezerInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Freezer.label', default: 'Freezer'), freezerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'freezer.label', default: 'Freezer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
