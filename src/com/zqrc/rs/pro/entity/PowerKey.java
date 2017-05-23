package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 *  用户权限表字段
 * @author JiaQi
 *
 */
public class PowerKey {
	private Integer id;//序号
	private String name;//字段名
	private Set<Power> self=new HashSet<Power>();
	private Set<Power> subs=new HashSet<Power>();
	private Set<Power> stus=new HashSet<Power>();
	public PowerKey() {
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
	public Set<Power> getSelf() {
		return self;
	}
	public void setSelf(Set<Power> self) {
		this.self = self;
	}
	public Set<Power> getSubs() {
		return subs;
	}
	public void setSubs(Set<Power> subs) {
		this.subs = subs;
	}
	public Set<Power> getStus() {
		return stus;
	}
	public void setStus(Set<Power> stus) {
		this.stus = stus;
	}
}

