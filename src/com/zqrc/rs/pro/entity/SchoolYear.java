package com.zqrc.rs.pro.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 学年
 * @author 李志飞
 *
 */
public class SchoolYear {
	private Integer id;
	private Date date;
	
	private Set<Student>students=new HashSet<Student>();
	
	public SchoolYear() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
}
