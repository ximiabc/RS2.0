package com.zqrc.rs.pro.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.Student;
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
	private String year_id;
	private String grade_id;
	private String type_id;
	private String select_name;
	private String datas;
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

	/**
	 * 批量导入学生
	 * @return
	 */
	public String addExcel() {
		return "addExcel";
	}
	
	/**
	 * 浏览学生
	 * @return
	 */
	public String list() {
		List<SchoolYear>years=yearService.getAllByNews();
		if(grade_id==null){grade_id="1";}
		if(type_id==null){type_id="1";}
		if(year_id==null){year_id=String.valueOf(years.get(0).getId());}
		
		List<Fields>fields=fieldService.getByComposite(Integer.parseInt(grade_id), Integer.parseInt(type_id), Integer.parseInt(year_id));
		if(fields.size()>=6){
			List<Fields>fields2=new ArrayList<Fields>(6);
			for(int i=0;i<6;i++){
				fields2.add(fields.get(i));
			}
			fields=fields2;
		}
		PageBean pageBean =studentService.getPageBean(pageNum,10, new HqlHelper(Student.class, "s").
				addOrderByProperty("id", false)
//				.addWhereCondition("u.role.id = ?",4)
				);
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("fields", fields);
		vs.set("years", years);
		vs.set("pageBean", pageBean);
		return "list";
	}
	
	/**
	 * 删除指定ID学生
	 * @return
	 */
	public String del() {
		statesService.delete(getModel().getId());
		addActionMessage("删除学生成功！");
		return list();
	}
	
	/**
	 * 审批学生
	 */
	public String audit() {
		return "audit";
	}
	
}
