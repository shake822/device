package com.comtop.device

/**
 * Created by zhaoqunqi on 2014/12/3.
 */
class UtilsService {

    /**
     * 分页查询的SQL
     * @param pageSize
     * @param currentPage
     * @param query 查询条件
     * @param toJson 转Json
     * @return
     */
    def findAll(Map params,Closure query) {
        params.order = "desc"
        params.sort = "createTime"
        query.call(params)
    }

    def getCount(Closure query){
        def params = [:]
        query.call(params)
    }
}