package com.zqrc.rs.pro.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
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
		PageBean pageBean =studentService.getPageBean(pageNum,10, new HqlHelper(Student.class, "s").
				addOrderByProperty("id", false)
//				.addWhereCondition("u.role.id = ?",4)
				);
		pageBean.setCurrentPage(pageNum);
		ValueStack vs = ServletActionContext.getContext().getValueStack();
		vs.set("pageBean", pageBean);
		return "list";
	}
	
	/**
	 * 审批学生
	 */
	public String audit() {
		return "audit";
	}
	
}
