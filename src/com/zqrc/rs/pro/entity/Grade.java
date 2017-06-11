package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 学生届别
 *
 */
public class Grade {
	private Integer id;
	private String name;
	private Set<Student>students=new HashSet<Student>();
	private Set<User>users =new HashSet<User>();
	
	public Integer getId() {
		return id;
	}
	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
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

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	public Grade() {
	}

}
