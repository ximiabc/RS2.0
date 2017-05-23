package com.zqrc.rs.pro.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 报名期限
 * @author 李志飞
 *
 */
public class DueTime implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer grade_id;
	private Integer type_id;
	
	private Date startDate;
	private Date endDate;
	public DueTime() {
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
