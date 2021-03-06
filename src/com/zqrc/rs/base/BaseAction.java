package com.zqrc.rs.base;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zqrc.rs.pro.entity.Power;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.pro.service.AuditService;
import com.zqrc.rs.pro.service.ChecksService;
import com.zqrc.rs.pro.service.DueTimeService;
import com.zqrc.rs.pro.service.FieldService;
import com.zqrc.rs.pro.service.GradeService;
import com.zqrc.rs.pro.service.PowerKeyService;
import com.zqrc.rs.pro.service.PowerService;
import com.zqrc.rs.pro.service.RoleService;
import com.zqrc.rs.pro.service.StatesService;
import com.zqrc.rs.pro.service.StudentService;
import com.zqrc.rs.pro.service.TypeService;
import com.zqrc.rs.pro.service.UserService;
import com.zqrc.rs.pro.service.YearService;

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
	 * 当前权限
	 */
	public void setCurrentPower(Power power) {
		ActionContext.getContext().getSession().put("currentPower", power);
	}
	public Power getCurrentPower() {
		return (Power)ActionContext.getContext().getSession().get("currentPower");
	}
	
	/**
	 * 注入所有的service
	 */
	@Resource
	protected UserService userService;
	@Resource
	protected FieldService fieldService;
	@Resource
	protected PowerService powerService;
	@Resource
	protected PowerKeyService powerKeyService;
	@Resource
	protected StudentService studentService;
	@Resource
	protected StatesService statesService;
	@Resource
	protected DueTimeService dueTimeService;
	@Resource
	protected GradeService gradeService;
	@Resource
	protected RoleService roleService;
	@Resource
	protected TypeService typeService;
	@Resource
	protected YearService yearService;
	@Resource
	protected AuditService auditService;
	@Resource
	protected ChecksService checksService;
}
