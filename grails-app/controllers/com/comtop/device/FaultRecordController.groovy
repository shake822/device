package com.comtop.device

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FaultRecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.order = "desc"
        params.sort = "createTime"
        println params
        String searchName ="%"
        if(params.reportUser !=null){
            searchName =  "%"+params.reportUser+"%"
            flash.reportUser = params.reportUser
        }
        boolean isEnd = false
        if(params.isEnd !=null || params.fromPage ==null){
            isEnd = true
            flash.isEnd = true
        }
        def data = FaultRecord.findAll(params){
            like("reportUserName",searchName)
            if(isEnd){
                isNull("repairUser")
            }
        }
        int count = 0
        if(isEnd){
            count  = FaultRecord.countByReportUserNameLikeAndRepairUserIsNull(searchName)
        }else {
            count  = FaultRecord.countByReportUserNameLike(searchName)
        }
        respond data, model:[faultRecordInstanceCount: count]
    }

    def show(FaultRecord faultRecordInstance) {
        respond faultRecordInstance
    }

    def create() {
        FaultRecord faultRecord = new FaultRecord(params)
        if(faultRecord.repairUser !=null){
            return
        }
        faultRecord.code =new Date().format("yyyyMMddHHmmssS")
        respond faultRecord
    }

    def repair(FaultRecord faultRecordInstance){
        if(faultRecordInstance.repairUser !=null){
            return
        }
        respond faultRecordInstance
    }
    @Transactional
    def updateForRepair(FaultRecord faultRecordInstance) {
        if (faultRecordInstance == null) {
            notFound()
            return
        }
        faultRecordInstance.repairUser=session.user
        faultRecordInstance.repairTime=new Date()
        println faultRecordInstance
        faultRecordInstance.validate()
        if (faultRecordInstance.hasErrors()) {
            respond faultRecordInstance.errors, view:'repair'
            return
        }

        faultRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'faultRecord.label', default: 'FaultRecord'), faultRecordInstance.code])
                redirect faultRecordInstance
            }
            '*'{ respond faultRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def save(FaultRecord faultRecordInstance) {
        if (faultRecordInstance == null) {
            notFound()
            return
        }
        Date date = new Date()
        faultRecordInstance.createTime=date
        faultRecordInstance.updateTime=date
        faultRecordInstance.validate()
        if (faultRecordInstance.hasErrors()) {
            respond faultRecordInstance.errors, view:'create'
            return
        }

        faultRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'faultRecord.label', default: 'FaultRecord'), faultRecordInstance.code])
                redirect faultRecordInstance
            }
            '*' { respond faultRecordInstance, [status: CREATED] }
        }
    }

    def edit(FaultRecord faultRecordInstance) {
        if(faultRecordInstance.repairUser !=null){
            return
        }
        respond faultRecordInstance
    }

    @Transactional
    def update(FaultRecord faultRecordInstance) {
        if (faultRecordInstance == null) {
            notFound()
            return
        }
        faultRecordInstance.updateTime=new Date()
        faultRecordInstance.validate()
        if (faultRecordInstance.hasErrors()) {
            respond faultRecordInstance.errors, view:'edit'
            return
        }

        faultRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'faultRecord.label', default: 'FaultRecord'), faultRecordInstance.code])
                redirect faultRecordInstance
            }
            '*'{ respond faultRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FaultRecord faultRecordInstance) {

        if (faultRecordInstance == null) {
            notFound()
            return
        }

        faultRecordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'faultRecord.label', default: 'FaultRecord'), faultRecordInstance.code])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'faultRecord.label', default: 'FaultRecord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
