package com.zqrc.rs.pro.action;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;

/**
 * 学生信息字段控制器
 * 
 * @author 李志飞
 *
 */
public class DateAction extends BaseAction<DueTime>{
	
	/**
	 * 报名日期
	 * @return
	 */
	public String view() {
		return "view";
	}
	
}
