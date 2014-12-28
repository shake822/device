package com.comtop.device



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FaultTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FaultType.list(params), model:[faultTypeInstanceCount: FaultType.count()]
    }

    def show(FaultType faultTypeInstance) {
        respond faultTypeInstance
    }

    def create() {
        respond new FaultType(params)
    }

    @Transactional
    def save(FaultType faultTypeInstance) {
        if (faultTypeInstance == null) {
            notFound()
            return
        }
        faultTypeInstance.createTime = new Date()
        faultTypeInstance.validate()
        if (faultTypeInstance.hasErrors()) {
            respond faultTypeInstance.errors, view:'create'
            return
        }

        faultTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'faultType.label', default: 'FaultType'), faultTypeInstance.name])
                redirect faultTypeInstance
            }
            '*' { respond faultTypeInstance, [status: CREATED] }
        }
    }

    def edit(FaultType faultTypeInstance) {
        respond faultTypeInstance
    }

    @Transactional
    def update(FaultType faultTypeInstance) {
        if (faultTypeInstance == null) {
            notFound()
            return
        }

        if (faultTypeInstance.hasErrors()) {
            respond faultTypeInstance.errors, view:'edit'
            return
        }

        faultTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'faultType.label', default: 'FaultType'), faultTypeInstance.name])
                redirect faultTypeInstance
            }
            '*'{ respond faultTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FaultType faultTypeInstance) {

        if (faultTypeInstance == null) {
            notFound()
            return
        }

        faultTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'faultType.label', default: 'FaultType'), faultTypeInstance.name])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'faultType.label', default: 'FaultType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
