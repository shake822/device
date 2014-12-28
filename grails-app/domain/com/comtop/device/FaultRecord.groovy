package com.comtop.device

class FaultRecord {

    String id

    String code

    String deviceNo

    String reportUserName

    String reportUserDept

    String description

    FaultType faultType

    //修复人
    User repairUser

    String repairDesc

    Date repairTime


    Date createTime

    Date updateTime


    static constraints = {
        repairUser(nullable: true)
        repairDesc(nullable: true)
        repairTime(nullable: true)
    }
}
