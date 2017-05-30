package com.zqrc.rs.pro.entity;

import java.io.Serializable;

/**
 *  学生数据字段角色
 * @author JiaQi
 *
 */
public class Fields implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer grade_id;
	private Integer type_id;
	
	
	private String name;//显示名
	private Integer orders;//排序号
	private String keyName;//行中字段名
	
	public Fields() {
	}
	
	public Integer getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(Integer grade_id) {
		this.grade_id = grade_id;
	}

	public Integer getType_id() {
		return type_id;
	}

	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrders() {
		return orders;
	}
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}
	
}

