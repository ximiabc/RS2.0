package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户表（教委高级、教委普通、学校、教师）
 * @author JiaQi
 */
public class User {
	private Integer id;
	private String name;
	private String pass;
	private Role role;//关联权限

	private User user;//关联一个上级
	private Set<User>users=new HashSet<User>();//关联多个下级

	public User() {
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
