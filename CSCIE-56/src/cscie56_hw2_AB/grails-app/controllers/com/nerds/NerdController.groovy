package com.nerds



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NerdController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Nerd.list(params), model:[nerdInstanceCount: Nerd.count()]
    }

    def show(Nerd nerdInstance) {
        respond nerdInstance
    }

    def create() {
        respond new Nerd(params)
    }

    @Transactional
    def save(Nerd nerdInstance) {
        if (nerdInstance == null) {
            notFound()
            return
        }

        if (nerdInstance.hasErrors()) {
            respond nerdInstance.errors, view:'create'
            return
        }

        nerdInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nerd.label', default: 'Nerd'), nerdInstance.id])
                redirect nerdInstance
            }
            '*' { respond nerdInstance, [status: CREATED] }
        }
    }

    def edit(Nerd nerdInstance) {
        respond nerdInstance
    }

    @Transactional
    def update(Nerd nerdInstance) {
        if (nerdInstance == null) {
            notFound()
            return
        }

        if (nerdInstance.hasErrors()) {
            respond nerdInstance.errors, view:'edit'
            return
        }

        nerdInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Nerd.label', default: 'Nerd'), nerdInstance.id])
                redirect nerdInstance
            }
            '*'{ respond nerdInstance, [status: OK] }
        }
    }

    @Transactional
    /*def delete(Nerd nerdInstance) {

        if (nerdInstance == null) {
            notFound()
            return
        }

        nerdInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Nerd.label', default: 'Nerd'), nerdInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nerd.label', default: 'Nerd'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
