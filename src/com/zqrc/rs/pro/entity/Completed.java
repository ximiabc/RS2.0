package com.zqrc.rs.pro.entity;

import java.util.Date;

/**
 * Completed 已完成报名学生表
 * 字段
 * Stu_id  学生id
 * User_id 添加人id
 * Com_time 报名时间
 * @author JiaQi
 *
 */
public class Completed {
	private Integer Stu_id;
	private Integer User_id;
	private Date Com_time;

	public Integer getStu_id() {
		return Stu_id;
	}
	public void setStu_id(Integer stu_id) {
		Stu_id = stu_id;
	}
	public Integer getUser_id() {
		return User_id;
	}
	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}
	public Date getCom_time() {
		return Com_time;
	}
	public void setCom_time(Date com_time) {
		Com_time = com_time;
	}

	public Completed(Integer stu_id, Integer user_id, Date com_time) {
		super();
		Stu_id = stu_id;
		User_id = user_id;
		Com_time = com_time;
	}
	
	public Completed() {
	}
	
	public String toString() {
		return "Completed [Stu_id=" + Stu_id + ", User_id=" + User_id
				+ ", Com_time=" + Com_time + "]";
	}
}
