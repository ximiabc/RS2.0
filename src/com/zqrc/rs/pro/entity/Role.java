package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 *  Role角色
 * @author JiaQi
 *
 */
public class Role {
	private Integer id;
	private String name;
	private Integer value;//0错误\1教委高级\2教委普通\3学校\4老师
	private Set<User>users=new HashSet<User>();
	public Role() {
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
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
}

