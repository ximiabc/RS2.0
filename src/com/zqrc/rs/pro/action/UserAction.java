package com.zqrc.rs.pro.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.sun.org.apache.bcel.internal.generic.GETSTATIC;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.User;

/**
 * 用户控制器（高级管理、普通管理、学校管理、教师管理）
 * 
 * @author 李志飞
 *
 */
public class UserAction extends BaseAction<User>{
	private String checkCode;//验证码
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return checkCode;
	}
	
	/**
	 * 登录页验证处理
	 */
	@Override
	public String execute() throws Exception {
		//验证码校验
		if(!checkCode.equals((String)ActionContext.getContext().getSession().get("securityCode"))){
			addActionError("验证码错误！");
			return "failed";
		}
		//账号校验
		User user=userService.login(getModel().getAccount(), getModel().getPass());
		if(null==user){
			addActionError("账号或密码错误！");
			return "failed";
		}else{
			setCurrentUser(user);
			return "success";
		}
	}
	
}
