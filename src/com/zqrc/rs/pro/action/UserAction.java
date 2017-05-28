package com.zqrc.rs.pro.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.until.HqlHelper;
import com.zqrc.rs.until.PageBean;

/**
 * 用户控制器（高级管理、普通管理、学校管理、教师管理）
 * 
 * @author 李志飞
 *
 */
public class UserAction extends BaseAction<User>{
	private String checkCode;//验证码
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return checkCode;
	}
	
	/**
	 * 列出所有教师
	 * @return
	 */
	public String teacherList(){
		PageBean pageBean =userService.getPageBean(pageNum,10, new HqlHelper(User.class, "u").
				addOrderByProperty("id", false).
				addWhereCondition("u.role.id = ?",4));
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "teacherList";
	}
	
	/**
	 * 列出所有学校
	 * @return
	 */
	public String schoolList(){
		PageBean pageBean =userService.getPageBean(pageNum,10, new HqlHelper(User.class, "u").
				addOrderByProperty("id", false).
				addWhereCondition("u.role.id = ?",3));
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "schoolList";
	}
	
	/**
	 * 浏览所有管理员
	 * @return
	 */
	public String manageList(){
		PageBean pageBean =userService.getPageBean(pageNum,10, new HqlHelper(User.class, "u").
				addOrderByProperty("id", false).
				addWhereCondition("u.role.id = ?",2));
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "manageList";
	}
	
	/**
	 * 个人管理
	 * @return
	 */
	public String personal(){
		User user=userService.getById(getCurrentUser().getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		return "person";
	}
	/**
	 * 更新个人信息
	 * @return
	 */
	public String personalUpdate(){
		User user=userService.getById(getCurrentUser().getId());
		user.setPass(getModel().getPass());
		user.setPhone(getModel().getPhone());
		user.setName(getModel().getName());
		user.setInfo(getModel().getInfo());
		userService.update(user);
		addActionMessage("修改成功！");
		personal();
		return "person";
	}
	
	/**
	 * 帮助页
	 * @return
	 */
	public String help(){
		return "help";
	}
	
	/**
	 * 欢迎面板-显示基本信息
	 * @return
	 */
	public String mainView(){
		return "main";
	}
	
	/**
	 * 登录页验证处理
	 */
	@Override
	public String execute() throws Exception {
		//验证码校验
		if(!checkCode.equals((String)ActionContext.getContext().getSession().get("securityCode"))){
			addActionError("验证码错误！");
			return "failed";
		}
		//账号校验
		User user=userService.login(getModel().getAccount(), getModel().getPass());
		if(null==user){
			addActionError("账号或密码错误！");
			return "failed";
		}else{
			setCurrentUser(user);
			return "success";
		}
	}
	
}
