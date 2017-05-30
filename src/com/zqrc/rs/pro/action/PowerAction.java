package com.zqrc.rs.pro.action;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Power;
import com.zqrc.rs.pro.entity.User;

/**
 * 用户控制器（高级管理、普通管理、学校管理、教师管理）
 * 
 * @author 李志飞
 *
 */
public class PowerAction extends BaseAction<Power>{
	
	
	/**
	 * 教委权限管理
	 * @return
	 */
	public String manage() {
		return "manage";
	}
	
	/**
	 * 学校权限管理
	 * @return
	 */
	public String master() {
		return "master";
	}
	
	/**
	 * 教师权限管理
	 * @return
	 */
	public String teacher() {
		return "teacher";
	}
	
}
