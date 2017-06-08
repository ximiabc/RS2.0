package com.zqrc.rs.pro.action;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

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
	private String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	/**
	 * 检查账号，存在返回true
	 * @param account
	 * @return
	 */
	private boolean checkAccount(String account){
		if(userService.findByAccount(account)!=null){
			return true;
		}else{
			return false;
		}
	}
	
	///////////////////////////////////////////////教师相关
	/**
	 * 列出所有教师
	 * @return
	 */
	public String teacherList(){
		HqlHelper helper=new HqlHelper(User.class, "u").addOrderByProperty("id", false).addWhereCondition("u.role.id = ?",4);
		if("1".equals(select_type)){//所有学校
		}else if("2".equals(select_type)){//学校账号
			helper=helper.addWhereCondition("u.user.account = ?",values);
		}else if("3".equals(select_type)){//学校名称
			helper=helper.addWhereCondition("u.user.name = ?",values);
		}else if("4".equals(select_type)){//教师账号
			helper=helper.addWhereCondition("u.account = ?",values);
		}else if("5".equals(select_type)){//教师名
			helper=helper.addWhereCondition("u.name = ?",values);
		}
		
		PageBean pageBean =userService.getPageBean(pageNum,10,helper);
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ActionContext.getContext().getValueStack();
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
		String accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));//账号生成算法
		while(checkAccount(accounts)){//检查账号是否存在
			accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));
		}
		user.setAccount(accounts);
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
	/**
	 * 更新教师
	 * @return
	 */
	public String teacherUpdate() {
		User user=userService.getById(getModel().getId());
		user.setPhone(getModel().getPhone());
		user.setNum(getModel().getNum());
		user.setInfo(getModel().getInfo());
		userService.update(user);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("修改成功！");
		return teacherList();
	}
	/**
	 * 通过ID查找教师
	 * @return
	 */
	public String teacherById(){
		getJsonUser();
		return "types";
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
		String accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));//账号生成算法
		while(checkAccount(accounts)){//检查账号是否存在
			accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));
		}
		user.setAccount(accounts);//账号生成算法
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
	/**
	 * 学校更新
	 * @return
	 */
	public String schoolUpdate() {
		User user=userService.getById(getModel().getId());
		user.setPhone(getModel().getPhone());
		user.setNum(getModel().getNum());
		user.setInfo(getModel().getInfo());
		userService.update(user);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("修改成功！");
		return schoolList();
	}
	/**
	 * 获取学校通过id
	 * @return
	 */
	public String schoolById(){
		
		getJsonUser();
		return "types";
	}
	
	/**
	 * 获取对象json
	 */
	private void getJsonUser() {
		User user=userService.getById(getModel().getId());
		System.out.println(getModel().getId());
		StringBuffer buffer=new StringBuffer("{\"code\":");
		if(user==null){
			buffer.append("\"0\"}");
		}else{
			if(user.getUser()==null){
				user.setUser(new User());
			}
			JSONObject object=new JSONObject();
			object.put("upaccount", user.getUser().getAccount());
			object.put("upname", user.getUser().getName());
			object.put("id", user.getId());
			object.put("name", user.getName());
			object.put("account", user.getAccount());
			object.put("phone", user.getPhone());
			object.put("info", user.getInfo());
			object.put("num", user.getNum());
			System.out.println(object.toString());
			setResult(object.toString());
		}
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
		String accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));//账号生成算法
		while(checkAccount(accounts)){//检查账号是否存在
			accounts=DateUtil.getAccount(str.substring(str.length()-4, str.length()));
		}
		user.setAccount(accounts);//账号生成算法
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
	/**
	 * 管理更新
	 * @return
	 */
	public String manageUpdate() {
		User user=userService.getById(getModel().getId());
		user.setPhone(getModel().getPhone());
		user.setNum(getModel().getNum());
		user.setInfo(getModel().getInfo());
		userService.update(user);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", user);
		addActionMessage("修改成功！");
		return manageList();
	}
	/**
	 * 
	 * @return
	 */
	public String manageById(){
		getJsonUser();
		return "types";
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
