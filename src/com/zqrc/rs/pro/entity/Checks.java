package com.zqrc.rs.pro.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 正则表达校验对象
 * @author 李志飞
 *
 */
public class Checks {
	private Integer id;
	private String name;
	private String checks;
	private String errorMsg;
	Set<Fields>fields=new HashSet<Fields>();
	public Checks() {
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
	public String getChecks() {
		return checks;
	}
	public void setChecks(String checks) {
		this.checks = checks;
	}
	public Set<Fields> getFields() {
		return fields;
	}
	public void setFields(Set<Fields> fields) {
		this.fields = fields;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
}
