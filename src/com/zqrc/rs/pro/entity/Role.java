package com.zqrc.rs.pro.entity;

/**
 *  Role角色
 *  字段
 *  User_id user id
 *  Role_name  角色名称
 *  Role 权限 
 * @author JiaQi
 *
 */
public class Role {
	private Integer User_id;
	private String Role_name;
	private Integer Role;
	
	public Integer getUser_id() {
		return User_id;
	}

	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}

	public String getRole_name() {
		return Role_name;
	}

	public void setRole_name(String role_name) {
		Role_name = role_name;
	}

	public Integer getRole() {
		return Role;
	}

	public void setRole(Integer role) {
		Role = role;
	}

	public Role() {
	}

	public Role(Integer user_id, String role_name, Integer role) {
		User_id = user_id;
		Role_name = role_name;
		Role = role;
	}
	
	public String toString() {
		return "Role [User_id=" + User_id + ", Role_name=" + Role_name
				+ ", Role=" + Role + "]";
	}
}
