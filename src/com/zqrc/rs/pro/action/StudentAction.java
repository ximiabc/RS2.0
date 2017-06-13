package com.zqrc.rs.pro.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionMessage;
import org.json.JSONObject;

import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Audit;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.Grade;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.States;
import com.zqrc.rs.pro.entity.Student;
import com.zqrc.rs.pro.entity.Type;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.pro.service.StudentService;
import com.zqrc.rs.until.HqlHelper;
import com.zqrc.rs.until.PageBean;

/**
 * 学生信息控制器
 * 
 * @author 李志飞
 *
 */
public class StudentAction extends BaseAction<Student>{
	
	/**
	 * 审批学生
	 * 学校、教师
	 */
	public String audit() {
		List<SchoolYear>years=yearService.getAllByNews();
		if(3 == (getCurrentUser().getRole().getId())){
			grade_id=String.valueOf(getCurrentUser().getGrade().getId());
		}else if(4 == (getCurrentUser().getRole().getId())){
			User sup=userService.getById(getCurrentUser().getId()).getUser();
			grade_id=String.valueOf(sup.getGrade().getId());
		}
		System.out.println(grade_id+","+type_id+"-"+year_id);
		
		if(null==year_id){
			year_id=String.valueOf(years.get(0).getId());
		}
		
		List<Fields>fields=fieldService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), Integer.parseInt(year_id));
		List<Fields>fields2=new ArrayList<Fields>(6);
		if(fields.size()>=6){
			for(int i=0;i<6;i++){
				fields2.add(fields.get(i));
			}
		}else{
			fields2=fields;
		}

		HqlHelper helper=new HqlHelper(Student.class, "s")
		//基本条件
		.addWhereCondition(null!=grade_id,"s.grade.id = ? ", Integer.parseInt(grade_id))
		.addWhereCondition(null!=type_id,"s.type.id = ? ", Integer.parseInt(type_id))
		.addWhereCondition(null!=year_id,"s.years.id = ? ", Integer.parseInt(year_id))
		//下拉查询条件
		.addWhereCondition(("2".equals(select_name)), "s.school.account = ?", datas)//学校编号
		.addWhereCondition(("3".equals(select_name)), "s.school.name = ?", datas)//学校名称
		.addWhereCondition(("4".equals(select_name)), "s.item1 = ?", datas)//学生编号
		.addWhereCondition(("5".equals(select_name)), "s.item2 = ?", datas)//学生名称
		.addWhereCondition(("6".equals(select_name)), "s.states.id = ?", 1)//未报名
		.addWhereCondition(("7".equals(select_name)), "s.states.id = ?", 2)//已报名
		.addWhereCondition(("8".equals(select_name)), "s.states.id = ?", 3)//申请退出
		.addWhereCondition(("9".equals(select_name)), "s.states.id = ?", 4)//失败
		//排序规则
		.addOrderByProperty("id", false);
		
		PageBean pageBean =studentService.getPageBean(pageNum,10,helper);
		pageBean.setCurrentPage(pageNum);
		
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("fields", fields2);//优先显示字段
		vs.set("fieldAll", fields);//所有字段
		vs.set("years", years);
		vs.set("pageBean", pageBean);
		vs.set("grade_id", grade_id);
		vs.set("type_id", type_id);
		return "audit";
	}
	/**
	 * 审批学生
	 * 报名功能
	 */
	public String auditPass() {
		User user=getCurrentUser();
		SchoolYear year=yearService.getNews();
		DueTime time1=null;
		DueTime time0=null;
		if(user.getRole().getId()==3){//学校
			time1=dueTimeService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), year.getId(), user.getId());
			time0=dueTimeService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), year.getId(), 0);//通用报名安排
		}else if(user.getRole().getId()==4){//教师
			time1=dueTimeService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), year.getId(), user.getUser().getId());
			time0=dueTimeService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), year.getId(), 0);//通用报名安排
		}
		Date date=new Date();
		if(null!=time1){//time1有数据
			if(date.after(time1.getStartDate())&&date.before(time1.getEndDate())){//在报名标准日期间
				if(inspect()){//报名功能
					States states=statesService.getById(2);
					Student student=studentService.getById(getModel().getId());
					student.setStates(states);
					student.setDate(new Date());
					
					if(user.getRole().getId()==4){//教师审核
						student.setTeacher(user);
						student.setSchool(user.getUser());
					}else if(user.getRole().getId()==3){//学校、审核
						student.setSchool(user);
					}
					studentService.update(student);
					addActionMessage("报名成功");
					audit();
					return "audit";
				}
			}
		}
		if(null!=time0){//通用日期
			if(date.after(time0.getStartDate())&&date.before(time0.getEndDate())){//在报名标准日期间
				if(inspect()){//报名功能
					States states=statesService.getById(2);
					Student student=studentService.getById(getModel().getId());
					student.setStates(states);
					student.setDate(new Date());
					
					if(user.getRole().getId()==4){//教师审核
						student.setTeacher(user);
						student.setSchool(user.getUser());
					}else if(user.getRole().getId()==3){//学校、审核
						student.setSchool(user);
					}
					studentService.update(student);
					addActionMessage("报名成功");
				}else{
					addActionMessage("报名验证失败！");
				}
			}else{
				addActionMessage("非报名时间！");
			}
		}else{
			addActionMessage("非报名时间！");
		}
		audit();
		return "audit";
	}
	
	/**
	 * 教委管理给学生报名学校
	 * @return
	 */
	public String auditPassadmin() {
		States states=statesService.getById(2);
		User user=userService.getById(Integer.parseInt(audit_str));
		Student student=studentService.getById(getModel().getId());
		student.setStates(states);
		student.setDate(new Date());
		student.setSchool(user);
		studentService.update(student);
		addActionMessage("报名成功！");
		return list();
	}
	
	/**
	 * 批量导入学生页跳转
	 * @return
	 */
	public String addExcel() {
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("grade_id", grade_id);
		vs.set("type_id", type_id);
		return "addExcel";
	}
	
	/**
	 * 浏览学生
	 * 主要为教委、管理员使用
	 * @return
	 */
	public String list() {
		List<SchoolYear>years=yearService.getAllByNews();
		
		if(grade_id==null){grade_id="1";}
		if(type_id==null){type_id="1";}
		if(year_id==null){year_id=String.valueOf(years.get(0).getId());}
		
		List<Fields>fields=fieldService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), Integer.parseInt(year_id));
		List<Fields>fields2=new ArrayList<Fields>(6);
		if(fields.size()>=6){
			for(int i=0;i<6;i++){
				fields2.add(fields.get(i));
			}
		}else{
			fields2=fields;
		}
		
		User sup=userService.getById(getCurrentUser().getId()).getUser();
		HqlHelper helper=new HqlHelper(Student.class, "s")
		//基本条件
		.addWhereCondition("s.grade.id = ? ", Integer.parseInt(grade_id))
		.addWhereCondition("s.type.id = ? ", Integer.parseInt(type_id))
		.addWhereCondition("s.years.id = ? ", Integer.parseInt(year_id))
		//下拉查询条件
		.addWhereCondition(("2".equals(select_name)), "s.school.account = ?", datas)//学校编号
		.addWhereCondition(("3".equals(select_name)), "s.school.name = ?", datas)//学校名称
		.addWhereCondition(("4".equals(select_name)), "s.item1 = ?", datas)//学生编号
		.addWhereCondition(("5".equals(select_name)), "s.item2 = ?", datas)//学生名称
		.addWhereCondition(("6".equals(select_name)), "s.states.id = ?", 1)//未报名
		.addWhereCondition(("7".equals(select_name)), "s.states.id = ?", 2)//已报名
		.addWhereCondition(("8".equals(select_name)), "s.states.id = ?", 3)//申请退出
		.addWhereCondition(("9".equals(select_name)), "s.states.id = ?", 4)//失败
		//指定中小学
		.addWhereCondition((getCurrentUser().getRole().getId() == 3 && 1 == getCurrentUser().getGrade().getId()), "s.grade.id = ? ", 1)//通过用户所属学历-小学
		.addWhereCondition((getCurrentUser().getRole().getId() == 3 && 2 == getCurrentUser().getGrade().getId()), "s.grade.id = ? ", 2)//通过用户所属学历-中学学
		.addWhereCondition((getCurrentUser().getRole().getId() == 4 && 1 == sup.getGrade().getId()), "s.grade.id = ? ", 1)//通过用户所属学历-小学
		.addWhereCondition((getCurrentUser().getRole().getId() == 4 && 2 == sup.getGrade().getId()), "s.grade.id = ? ", 2)//通过用户所属学历-中学学
		//排序规则
		.addOrderByProperty("id", false);
		
		PageBean pageBean =studentService.getPageBean(pageNum,10,helper);
		pageBean.setCurrentPage(pageNum);
		
		List<User> schools=userService.getSchoolByGrade(Integer.parseInt(grade_id));
		
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("fields", fields2);//优先显示字段
		vs.set("fieldAll", fields);//所有字段
		vs.set("years", years);
		vs.set("pageBean", pageBean);
		vs.set("grade_id", grade_id);
		vs.set("type_id", type_id);
		vs.set("schools", schools);
		return "list";
	}
	
	/**
	 * 删除指定ID学生
	 * @return
	 */
	public String del() {
		studentService.delete(getModel().getId());
		addActionMessage("删除学生成功！");
		return list();
	}
	
	/**
	 * 更新数据
	 * @return
	 */
	public String update() {
		Grade grade=gradeService.loadById(Integer.parseInt(grade_id));
		Type type=typeService.loadById(Integer.parseInt(type_id));
		SchoolYear year=yearService.loadById(Integer.parseInt(year_id));
		States states=statesService.loadById(1);
		model.setGrade(grade);
		model.setType(type);
		model.setYears(year);
		model.setStates(states);
		model.setStutype(Integer.parseInt(stuType_id));
		model.setDate(new Date());
		studentService.update(getModel());
		addActionMessage("修改学生成功！");
		return list();
	}
	
	/**
	 * 添加学生
	 * @return
	 */
	public String add(){
		Grade grade=gradeService.getById(Integer.parseInt(grade_id));
		Type type=typeService.getById(Integer.parseInt(type_id));
		SchoolYear year=yearService.getById(Integer.parseInt(year_id));
		States states=statesService.getById(1);
		model.setGrade(grade);
		model.setType(type);
		model.setYears(year);
		model.setStates(states);
		model.setStutype(Integer.parseInt(stuType_id));
		model.setDate(new Date());
		studentService.save(model);
		addActionMessage("添加成功！");
		return list();
	}
	
	/**
	 * getStudentToJson
	 * @return
	 */
	public String studentById() {
		Student user=studentService.getById(getModel().getId());
		System.out.println(getModel().getId());
		StringBuffer buffer=new StringBuffer("{\"code\":");
		if(user==null){
			buffer.append("\"0\"}");
		}else{
			JSONObject object=new JSONObject();
			User user2=user.getSchool();
			User user3=user.getTeacher();
			if(user2==null){user2=new User();}
			if(user3==null){user3=new User();}
			object.put("id", user.getId());
			object.put("type", user.getType().getId());
			object.put("grade", user.getGrade().getId());
			object.put("date", user.getDate());
			object.put("years", user.getYears().getId());
			object.put("stutype", user.getStutype());
			object.put("school", user2.getName());
			object.put("teacher", user3.getName());
				object.put("item1", user.getItem1());
				object.put("item2", user.getItem2());
				object.put("item3", user.getItem3());
				object.put("item4", user.getItem4());
				object.put("item5", user.getItem5());
				object.put("item6", user.getItem6());
				object.put("item7", user.getItem7());
				object.put("item8", user.getItem8());
				object.put("item9", user.getItem9());
				object.put("item10", user.getItem10());
				object.put("item11", user.getItem11());
				object.put("item12", user.getItem12());
				object.put("item13", user.getItem13());
				object.put("item14", user.getItem14());
				object.put("item15", user.getItem15());
				object.put("item16", user.getItem16());
				object.put("item17", user.getItem17());
				object.put("item18", user.getItem18());
				object.put("item19", user.getItem19());
				object.put("item20", user.getItem20());
				object.put("item21", user.getItem21());
				object.put("item22", user.getItem22());
				object.put("item23", user.getItem23());
				object.put("item24", user.getItem24());
				object.put("item25", user.getItem25());
				object.put("item26", user.getItem26());
				object.put("item27", user.getItem27());
				object.put("item28", user.getItem28());
				object.put("item29", user.getItem29());
				object.put("item30", user.getItem30());
				object.put("item31", user.getItem31());
				object.put("item32", user.getItem32());
				object.put("item33", user.getItem33());
				object.put("item34", user.getItem34());
				object.put("item35", user.getItem35());
				object.put("item36", user.getItem36());
				object.put("item37", user.getItem37());
				object.put("item38", user.getItem38());
				object.put("item39", user.getItem39());
				object.put("item40", user.getItem40());
			System.out.println(object.toString());
			setResult(object.toString());
		}
		return "types";
	}
	
	private String year_id;
	private String grade_id;
	private String type_id;
	private String stuType_id;
	private String select_name;//查询选框
	private String datas;//查询条件
	public String getYear_id() {
		return year_id;
	}

	public void setYear_id(String year_id) {
		this.year_id = year_id;
	}

	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getType_id() {
		return type_id;
	}

	public void setType_id(String type_id) {
		this.type_id = type_id;
	}

	public String getSelect_name() {
		return select_name;
	}

	public void setSelect_name(String select_name) {
		this.select_name = select_name;
	}

	public String getDatas() {
		return datas;
	}

	public void setDatas(String datas) {
		this.datas = datas;
	}
	
	public String getStuType_id() {
		return stuType_id;
	}

	public void setStuType_id(String stuType_id) {
		this.stuType_id = stuType_id;
	}
	private String result;
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	
	private String audit_str;
	
	public String getAudit_str() {
		return audit_str;
	}

	public void setAudit_str(String audit_str) {
		this.audit_str = audit_str;
	}

	/**
	 * 报名字段验证
	 * @return
	 */
	private boolean inspect(){
		Student student = studentService.getById(getModel().getId());
		Audit audit = auditService.findByComposite(student.getGrade().getId(), student.getType().getId(), student.getYears().getId());
		Map<String, String> stu_map = studentService.findStudentMap(student.getId());
		
		Fields fields = fieldService.findByComposite(student.getGrade().getId(), student.getType().getId(), student.getYears().getId(), audit.getField_id());
		String kay = stu_map.get(fields.getKeyName());
		if(audit_str.equals(kay)){
			addActionMessage("审核成功");
			return true;
		}else{
			addActionMessage("审核失败！请校验信息");
			return false;
		}
	}
}
