package com.zqrc.rs.pro.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Audit;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.Student;

/**
 * 审核字段
 * @author JiaQi
 *
 */
public class AuditAction extends BaseAction<Audit>{
	private Integer selectId;
	private Integer stu_id;
	
	public Integer getStu_id() {
		return stu_id;
	}

	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}

	public Integer getSelectId() {
		return selectId;
	}

	public void setSelectId(Integer selectId) {
		this.selectId = selectId;
	}
	
	

	//	获取小学辖区内审核字段
	public String findPrimaryIn(){
		Integer time = yearService.getNews().getId();
		Audit audit = auditService.findByComposite(1,1,time);
		List<Fields> list_primaryIn = fieldService.getByComposite(1,1,time);
		ValueStack stack=ActionContext.getContext().getValueStack();
		if(audit != null){
			stack.set("Audit",audit.getField_id());
		}
		stack.set("beans", list_primaryIn);
		return "PrimaryIn";
	}
	
//	设置小学辖区内审核字段
	public String SetPrimaryIn(){
		Integer time = yearService.getNews().getId();
		Audit audit = new Audit();
		
		Fields f = fieldService.findByComposite(1, 1, time, selectId);
		
		audit.setYear_id(f.getYear_id());
		audit.setType_id(f.getType_id());
		audit.setGrade_id(f.getGrade_id());
		audit.setName(f.getName());
		audit.setField_id(selectId);
		auditService.saveOrUpdate(audit);
		findPrimaryIn();
		
		return "PrimaryIn";
	}
	
//	/////////////////////小学辖区外//////////////////////////////////
	
	//	获取小学辖区内审核字段
	public String findPrimaryOut(){
		Integer time = yearService.getNews().getId();
		Audit audit = auditService.findByComposite(1,2,time);
		List<Fields> list_primaryIn = fieldService.getByComposite(1,2,time);
		ValueStack stack=ActionContext.getContext().getValueStack();
		if(audit != null){
			stack.set("Audit",audit.getField_id());
		}
		stack.set("beans", list_primaryIn);
		return "PrimaryOut";
	}
	
//	设置小学辖区内审核字段
	public String SetPrimaryOut(){
		Integer time = yearService.getNews().getId();
		Audit audit = new Audit();
		
		Fields f = fieldService.findByComposite(1, 2, time, selectId);
		
		audit.setYear_id(f.getYear_id());
		audit.setType_id(f.getType_id());
		audit.setGrade_id(f.getGrade_id());
		audit.setName(f.getName());
		audit.setField_id(selectId);
		auditService.saveOrUpdate(audit);
		findPrimaryOut();
		
		return "PrimaryOut";
	}
	
//	///////////////////中学辖区外//////////////////////
	//	获取小学辖区内审核字段
	public String findMiddleOut(){
		Integer time = yearService.getNews().getId();
		Audit audit = auditService.findByComposite(2,2,time);
		List<Fields> list_primaryIn = fieldService.getByComposite(2,2,time);
		ValueStack stack=ActionContext.getContext().getValueStack();
		if(audit != null){
			stack.set("Audit",audit.getField_id());
		}
		stack.set("beans", list_primaryIn);
		return "MiddleOut";
	}
	
//	设置小学辖区内审核字段
	public String SetMiddleOut(){
		Integer time = yearService.getNews().getId();
		Audit audit = new Audit();
		
		Fields f = fieldService.findByComposite(2, 2, time, selectId);
		
		audit.setYear_id(f.getYear_id());
		audit.setType_id(f.getType_id());
		audit.setGrade_id(f.getGrade_id());
		audit.setName(f.getName());
		audit.setField_id(selectId);
		auditService.saveOrUpdate(audit);
		findMiddleOut();
		
		return "MiddleOut";
	}
//	/////////////////////////////////////////////
	//	获取小学辖区内审核字段
	public String findMiddleIn(){
		Integer time = yearService.getNews().getId();
		Audit audit = auditService.findByComposite(2,1,time);
		List<Fields> list_primaryIn = fieldService.getByComposite(2,1,time);
		ValueStack stack=ActionContext.getContext().getValueStack();
		if(audit != null){
			stack.set("Audit",audit.getField_id());
		}
		stack.set("beans", list_primaryIn);
		return "MiddleIn";
	}
	
//	设置小学辖区内审核字段
	public String SetMiddleIn(){
		Integer time = yearService.getNews().getId();
		Audit audit = new Audit();
		
		Fields f = fieldService.findByComposite(2, 1, time, selectId);
		
		audit.setYear_id(f.getYear_id());
		audit.setType_id(f.getType_id());
		audit.setGrade_id(f.getGrade_id());
		audit.setName(f.getName());
		audit.setField_id(selectId);
		auditService.saveOrUpdate(audit);
		findMiddleIn();
		
		return "MiddleIn";
	}
//	/////////////////////////////////////////////////
}
