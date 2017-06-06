package com.zqrc.rs.pro.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 验证字段
 * @author 李志飞
 *
 */
public class Audit implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer grade_id;
	private Integer type_id;
	private Integer year_id;
	
	private Integer field_id;
	private String name;
	
	public Audit() {
	}
	
	public Integer getField_id() {
		return field_id;
	}

	public void setField_id(Integer field_id) {
		this.field_id = field_id;
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

	public Integer getYear_id() {
		return year_id;
	}

	public void setYear_id(Integer year_id) {
		this.year_id = year_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
