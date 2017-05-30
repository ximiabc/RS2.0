package com.zqrc.rs.base;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.pro.service.PowerKeyService;
import com.zqrc.rs.pro.service.PowerService;
import com.zqrc.rs.pro.service.StudentService;
import com.zqrc.rs.pro.service.UserService;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	protected T model;
	public BaseAction(){
		try{
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			model = clazz.newInstance();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	protected int pageNum = 1;

	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	//获取模型驱动
	public T getModel(){
		return model;
	}
	
	/**
	 * 当前用户对象
	 */
	public void setCurrentUser(User currentUser) {
		ActionContext.getContext().getSession().put("currentUser", currentUser);
	}
	public User getCurrentUser() {
		return (User)ActionContext.getContext().getSession().get("currentUser");
	}
	
	/**
	 * 注入所有的service
	 */
	@Resource
	protected UserService userService;
	@Resource
	protected PowerService powerService;
	@Resource
	protected PowerKeyService powerKeyService;
	@Resource
	protected StudentService studentService;
}
