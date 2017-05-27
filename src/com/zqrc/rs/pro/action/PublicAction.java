package com.zqrc.rs.pro.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 公共部分控制器
 * @author 李志飞
 *
 */
public class PublicAction extends ActionSupport{
	
	/**
	 * 默认登录页面
	 * @return
	 */
	public String index(){
		return "index";
	}
	/**
	 * 退出页
	 * @return
	 */
	public String exit() {
		return "exit";
	}
}
