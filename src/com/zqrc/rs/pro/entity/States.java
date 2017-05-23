package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 学生报名状态
 *
 */
public class States {
	private Integer id;
	private String name;//未报名、报名成功（认证成功 ）、报名失败、认证审核中、认证失败、
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

	public States() {
	}

}
