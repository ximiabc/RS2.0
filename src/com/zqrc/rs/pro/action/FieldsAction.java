package com.zqrc.rs.pro.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;

/**
 * 学生信息字段控制器
 * 
 * @author 李志飞
 *
 */
public class FieldsAction extends BaseAction<Fields>{
	
	/**
	 * 小学辖区内
	 * @return
	 */
	public String primaryIn() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(1, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "primaryIn";
	}
	
	/**
	 * 小学辖区外
	 * @return
	 */
	public String primaryOut() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(1, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * @return
	 */
	public String middleIn() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(2, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * @return
	 */
	public String middleOut() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(2, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "middleOut";
	}
	
	/**
	 * 通用代码
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	private List<Fields> getFields(Integer grade, Integer type, Integer year){
		return fieldService.getByComposite(grade, type, year);
	}
	
	/**
	 * 添加字段
	 */
	private void add(){
	}
	/**
	 * 更新字段
	 */
	private void update(){
	}
	/**
	 * 字段排序
	 */
	private void reSort(){
	}
	/**
	 * 删除字段
	 */
	private void delete(){
	}
	
}
