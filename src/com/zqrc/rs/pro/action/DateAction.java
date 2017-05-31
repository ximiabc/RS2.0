package com.zqrc.rs.pro.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.SchoolYear;

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
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
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
		DueTime dueTime=getDueTime(1, 1, year.getId());
		if(dueTime==null){
			dueTime=new DueTime();
			dueTime.setGrade_id(1);
			dueTime.setType_id(1);
			dueTime.setYear_id(year.getId());
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.save(dueTime);
		}else{
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.update(dueTime);
		}
		primaryIn();
		addActionMessage("修改成功！");
		return "primaryIn";
	}
	
	
	/**
	 * 小学辖区外
	 * @return
	 */
	public String primaryOut() {
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(1, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
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
		DueTime dueTime=getDueTime(1, 2, year.getId());
		if(dueTime==null){
			dueTime=new DueTime();
			dueTime.setGrade_id(1);
			dueTime.setType_id(2);
			dueTime.setYear_id(year.getId());
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.save(dueTime);
		}else{
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.update(dueTime);
		}
		primaryOut();
		addActionMessage("修改成功！");
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * @return
	 */
	public String middleIn() {
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
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
		DueTime dueTime=getDueTime(2, 1, year.getId());
		if(dueTime==null){
			dueTime=new DueTime();
			dueTime.setGrade_id(2);
			dueTime.setType_id(1);
			dueTime.setYear_id(year.getId());
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.save(dueTime);
		}else{
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.update(dueTime);
		}
		middleIn();
		addActionMessage("修改成功！");
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * @return
	 */
	public String middleOut() {
		SchoolYear year=yearService.getNews();
		DueTime dueTime=getDueTime(2, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", dueTime);
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
		DueTime dueTime=getDueTime(2, 2, year.getId());
		if(dueTime==null){
			dueTime=new DueTime();
			dueTime.setGrade_id(2);
			dueTime.setType_id(2);
			dueTime.setYear_id(year.getId());
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.save(dueTime);
		}else{
			dueTime.setStartDate(format.parse(startDates));
			dueTime.setEndDate(format.parse(endDates));
			dueTimeService.update(dueTime);
		}
		middleOut();
		addActionMessage("修改成功！");
		return "middleOut";
	}
	
	/**
	 * 通用代码
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	private DueTime getDueTime(Integer grade, Integer type, Integer year){
		return dueTimeService.getByComposite(grade, type, year);
	}
	
}
