package com.zqrc.rs.pro.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.User;

/**
 * 学生信息字段控制器
 * 
 * @author 李志飞
 *
 */
public class DateAction extends BaseAction<DueTime>{
	
	private String startDates;
	private String endDates;
	public String getStartDates() {
		return startDates;
	}
	public void setStartDates(String startDates) {
		this.startDates = startDates;
	}
	public String getEndDates() {
		return endDates;
	}
	public void setEndDates(String endDates) {
		this.endDates = endDates;
	}
	/**
	 * 小学辖区内
	 * @return
	 */
	public String primaryIn() {
		List<User>schoolList=userService.getSchoolByGrade(1);
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 1, year.getId(),0);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
		stack.set("schools", schoolList);
		return "primaryIn";
	}
	/**
	 * 小学辖区内更新
	 * @return
	 * @throws ParseException 
	 */
	public String primaryInUpdate() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 1, year.getId(),getModel().getSchool_id());
		if(format.parse(startDates).before(format.parse(endDates))){
			if(dueTime==null){
				dueTime=new DueTime();
				dueTime.setGrade_id(1);
				dueTime.setType_id(1);
				dueTime.setYear_id(year.getId());
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTime.setSchool_id(getModel().getSchool_id());
				dueTimeService.save(dueTime);
			}else{
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTimeService.update(dueTime);
			}
			primaryIn();
			addActionMessage("修改成功！");
		}else{
			primaryIn();
			addActionMessage("修改参数不合法！请检查");
		}
		return "primaryIn";
	}
	
	
	/**
	 * 小学辖区外
	 * @return
	 */
	public String primaryOut() {
		List<User>schoolList=userService.getSchoolByGrade(1);
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 2, year.getId(),0);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
		stack.set("schools", schoolList);
		return "primaryOut";
	}
	
	/**
	 * 小学辖区外更新
	 * @return
	 * @throws ParseException 
	 */
	public String primaryOutUpdate() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 2, year.getId(),getModel().getSchool_id());
		if(format.parse(startDates).before(format.parse(endDates))){
			if(dueTime==null){
				dueTime=new DueTime();
				dueTime.setGrade_id(1);
				dueTime.setType_id(2);
				dueTime.setYear_id(year.getId());
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTime.setSchool_id(getModel().getSchool_id());
				dueTimeService.save(dueTime);
			}else{
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTimeService.update(dueTime);
			}
			primaryOut();
			addActionMessage("修改成功！");
		}else{
			primaryOut();
			addActionMessage("修改参数不合法！请检查");
		}
		
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * @return
	 */
	public String middleIn() {
		List<User>schoolList=userService.getSchoolByGrade(2);
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 1, year.getId(),0);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
		stack.set("schools", schoolList);
		return "middleIn";
	}
	
	/**
	 * 中学辖区内更新
	 * @return
	 * @throws ParseException 
	 */
	public String middleInUpdate() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 1, year.getId(), getModel().getSchool_id());
		if(format.parse(startDates).before(format.parse(endDates))){
			if(dueTime==null){
				dueTime=new DueTime();
				dueTime.setGrade_id(2);
				dueTime.setType_id(1);
				dueTime.setYear_id(year.getId());
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTime.setSchool_id(getModel().getSchool_id());
				dueTimeService.save(dueTime);
			}else{
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTimeService.update(dueTime);
			}
			middleIn();
			addActionMessage("修改成功！");
		}else{
			middleIn();
			addActionMessage("修改参数不合法！请检查");
		}
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * @return
	 */
	public String middleOut() {
		List<User>schoolList=userService.getSchoolByGrade(2);
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 2, year.getId(),0);
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
		stack.set("schools", schoolList);
		return "middleOut";
	}
	
	/**
	 * 中学辖区外更新
	 * @return
	 * @throws ParseException 
	 */
	public String middleOutUpdate() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 2, year.getId(),getModel().getSchool_id());
		if(format.parse(startDates).before(format.parse(endDates))){
			if(dueTime==null){
				dueTime=new DueTime();
				dueTime.setGrade_id(2);
				dueTime.setType_id(2);
				dueTime.setYear_id(year.getId());
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTime.setSchool_id(getModel().getSchool_id());
				dueTimeService.save(dueTime);
			}else{
				dueTime.setStartDate(format.parse(startDates));
				dueTime.setEndDate(format.parse(endDates));
				dueTimeService.update(dueTime);
			}
			middleOut();
			addActionMessage("修改成功！");
		}else{
			middleOut();
			addActionMessage("修改参数不合法！请检查");
		}
		return "middleOut";
	}
	
	/**
	 * 通用代码
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	private DueTime getDueTime(Integer grade, Integer type, Integer year,Integer school){
		return dueTimeService.getByComposite(grade, type, year,school);
	}
	
}
