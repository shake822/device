package com.comtop.device


class SessionFilterFilters {


    def filters = {
        loginCheck(controller: '*', action: '*') {
            before = {
                response.setHeader("Access-Control-Allow-Origin", "null")
                response.setHeader("Access-Control-Allow-Credentials", "true")
                response.setHeader("P3P", "CP=CAO PSA OUR")
                if (!session.user) {
                    render(view:"/login")
                    return true
                }
                return true
            }
        }
    }
}
