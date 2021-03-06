package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户表（教委高级、教委普通、学校、教师）
 * @author JiaQi
 */
public class User {
	private Integer id;
	private String account;
	private String name;
	private String pass;
	private Role role;//关联权限
	private Integer num;//报名人数限制
	private String phone;//电话
	private String info;//描述信息
	private User user;//关联一个上级
	private Set<User>users=new HashSet<User>();//关联多个下级
	
	private Grade grade;
	private Set<Student> belongSchool=new HashSet<Student>();//所属学校（针对教委）
	private Set<Student> belongTeacher=new HashSet<Student>();//所属操作老师（针对学校）

	public User() {
	}
	
	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
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

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Set<Student> getBelongSchool() {
		return belongSchool;
	}

	public void setBelongSchool(Set<Student> belongSchool) {
		this.belongSchool = belongSchool;
	}

	public Set<Student> getBelongTeacher() {
		return belongTeacher;
	}

	public void setBelongTeacher(Set<Student> belongTeacher) {
		this.belongTeacher = belongTeacher;
	}
}
