package com.zqrc.rs.pro.action;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;

/**
 * 学生信息字段控制器
 * 
 * @author 李志飞
 *
 */
public class FieldsAction extends BaseAction<Fields>{
	
	
	/**
	 * 小学辖区内
	 * @return
	 */
	public String primaryIn() {
		return "primaryIn";
	}
	
	/**
	 * 小学辖区外
	 * @return
	 */
	public String primaryOut() {
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * @return
	 */
	public String middleIn() {
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * @return
	 */
	public String middleOut() {
		return "middleOut";
	}
	
}
