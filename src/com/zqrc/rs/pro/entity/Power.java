package com.zqrc.rs.pro.entity;

/**
 *  用户权限表
 * @author JiaQi
 *
 */
public class Power {
	private Integer id;//序号
	private String name;//字段名
	private PowerKey self;//个人操作
	private PowerKey subs;//下级操作
	private PowerKey stus;//学生操作
	public Power() {
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public PowerKey getSelf() {
		return self;
	}
	public void setSelf(PowerKey self) {
		this.self = self;
	}
	public PowerKey getSubs() {
		return subs;
	}
	public void setSubs(PowerKey subs) {
		this.subs = subs;
	}
	public PowerKey getStus() {
		return stus;
	}
	public void setStus(PowerKey stus) {
		this.stus = stus;
	}
}

