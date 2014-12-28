package com.comtop.device

/**
 * 错误类型
 */
class FaultType {
    //主键
    String id
    //名称
    String name
    Date createTime
    static constraints = {
//        createTime(nullable: true)
    }
}
