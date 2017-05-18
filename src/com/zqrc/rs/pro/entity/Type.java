package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 学生类别
 * @author JiaQi
 *
 */
public class Type {
	private Integer id;
	private String name;
	private Set<Student>students=new HashSet<Student>();
	
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

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	public Type() {
	}

}
