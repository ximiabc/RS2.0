package com.zqrc.rs.pro.entity;

/**
 *  学生数据字段角色
 * @author JiaQi
 *
 */
public class Fields {
	private Integer id;//序号
	private String name;//字段名
	private Integer order;//排序号
	public Fields() {
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
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
}

