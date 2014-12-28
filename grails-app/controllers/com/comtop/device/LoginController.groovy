package com.comtop.device

import com.comtop.mobile.utils.MD5Tools
import com.comtop.utils.MD5Tools
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoginController {

	def index() {
		render(view:"/login")
	}

	def login(){
		String account = params["account"]
		String password = params["password"]
		String md5Password = MD5Tools.toMD5(password)
		println md5Password
		User user = User.findWhere(account:"$account",passwd:"$md5Password",canLogin: true)
		if(user ==null){
			flash.message = "用户名密码错误"
			render(view:"/login")
			return 
		}
		if(user.isLock){
			flash.message = "帐号被锁定"
			render(view:"/login")
			return
		}
		session.user = user
		redirect(uri: "/")
		return
//		render user as JSON
	}

	def logout(){
		session.invalidate()
		render(view:"/login")
	}
}
