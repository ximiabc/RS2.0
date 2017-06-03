package com.zqrc.rs.pro.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.until.DateUtil;
import com.zqrc.rs.until.HqlHelper;
import com.zqrc.rs.until.PageBean;

/**
 * 用户控制器（高级管理、普通管理、学校管理、教师管理）
 * 
 * @author 李志飞
 *
 */
public class UserAction extends BaseAction<User>{
	private String select_type;
	private String values;
	private String role_id;
	private String pass0;
	private String pass1;
	private String checkCode;//验证码
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public String getPass0() {
		return pass0;
	}
	public void setPass0(String pass0) {
		this.pass0 = pass0;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getSelect_type() {
		return select_type;
	}
	public void setSelect_type(String select_type) {
		this.select_type = select_type;
	}
	public String getValues() {
		return values;
	}
	public void setValues(String values) {
		this.values = values;
	}
	
	///////////////////////////////////////////////教师相关
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
	 * 添加教师
	 * @return
	 */
	public String teacherAdd(){
		User user=getModel();
		User admin=getCurrentUser();
		String str=admin.getAccount();
		String phone=getModel().getPhone();
		user.setAccount(DateUtil.getAccount(str.substring(str.length()-4, str.length())));//账号生成算法
		user.setPass(phone.substring(phone.length()-6, phone.length()));
		user.setRole(roleService.getById(4));
		user.setUser(admin);
		System.out.println(user.getAccount()+"=="+user.getPass());
		userService.save(user);
		teacherList();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("添加成功！");
		return "teacherList";
	}
	/**
	 * 删除教师
	 * @return
	 */
	public String teacherDel(){
		userService.delete(getModel().getId());
		teacherList();
		addActionMessage("删除教师成功！");
		return "teacherList";
	}
	///////////////////////////////////////////////学校相关
	/**
	 * 列出所有学校
	 * @return
	 */
	public String schoolList(){
		HqlHelper helper=new HqlHelper(User.class, "u").addOrderByProperty("id", false).addWhereCondition("u.role.id = ?",3);
		if("4".equals(select_type)){//所有学校
		}else if("2".equals(select_type)){//学校账号
			helper=helper.addWhereCondition("u.account = ?",values);
		}else if("3".equals(select_type)){//学校名称
			helper=helper.addWhereCondition("u.name = ?",values);
		}else if("1".equals(select_type)){//关联账号
			helper=helper.addWhereCondition("u.user.account = ?",getCurrentUser().getAccount());
		}
		PageBean pageBean =userService.getPageBean(pageNum,10, helper);
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "schoolList";
	}
	/**
	 * 添加学校
	 * @return
	 */
	public String schoolAdd(){
		User user=getModel();
		User admin=getCurrentUser();
		String str=admin.getAccount();
		String phone=getModel().getPhone();
		user.setAccount(DateUtil.getAccount(str.substring(str.length()-4, str.length())));//账号生成算法
		user.setPass(phone.substring(phone.length()-6, phone.length()));
		user.setRole(roleService.getById(3));
		user.setUser(admin);
		System.out.println(user.getAccount()+"=="+user.getPass());
		userService.save(user);
		schoolList();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("添加成功！");
		return "schoolList";
	}
	/**
	 * 删除学校
	 * @return
	 */
	public String schoolDel(){
		userService.delete(getModel().getId());
		addActionMessage("删除成功！");
		return schoolList();
	}
	
	//////////////////////////////////////////////管理员相关
	/**
	 * 浏览所有管理员
	 * @return
	 */
	public String manageList(){
		HqlHelper helper=new HqlHelper(User.class, "u").addOrderByProperty("id", false).addWhereCondition("u.role.id = ?",2);
		if("1".equals(select_type)){//所有
		}else if("2".equals(select_type)){
			helper=helper.addWhereCondition("u.account = ?",values);
		}else if("3".equals(select_type)){
			helper=helper.addWhereCondition("u.name = ?",values);
		}
		PageBean pageBean =userService.getPageBean(pageNum,10, helper);
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "manageList";
	}
	/**
	 * 添加管理员
	 * @return
	 */
	public String manageAdd() {
		User user=getModel();
		User admin=getCurrentUser();
		String str=admin.getAccount();
		String phone=getModel().getPhone();
		user.setAccount(DateUtil.getAccount(str.substring(str.length()-4, str.length())));//账号生成算法
		user.setPass(phone.substring(phone.length()-6, phone.length()));
		user.setRole(roleService.getById(2));
		user.setUser(admin);
		userService.save(user);
		manageList();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("添加成功！");
		return "manageList";
	}
	/**
	 * 删除管理员
	 * @return
	 */
	public String manageDel(){
		userService.delete(getModel().getId());
		addActionMessage("删除成功！");
		return manageList();
	}
	
	////////////////////////////////////////////////个人相关
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
	
	
	//////////////////////////////////////////公共部分
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
