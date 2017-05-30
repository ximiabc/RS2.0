package com.zqrc.rs.pro.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Power;
import com.zqrc.rs.pro.entity.PowerKey;
import com.zqrc.rs.pro.entity.User;

/**
 * 用户控制器（高级管理、普通管理、学校管理、教师管理）
 * 
 * @author 李志飞
 *
 */
public class PowerAction extends BaseAction<Power>{
	private Integer self_id;
	private Integer subs_id;
	private Integer stus_id;

	public Integer getSelf_id() {
		return self_id;
	}

	public void setSelf_id(Integer self_id) {
		this.self_id = self_id;
	}

	public Integer getSubs_id() {
		return subs_id;
	}

	public void setSubs_id(Integer subs_id) {
		this.subs_id = subs_id;
	}

	public Integer getStus_id() {
		return stus_id;
	}

	public void setStus_id(Integer stus_id) {
		this.stus_id = stus_id;
	}

	/**
	 * 教委权限管理
	 * @return
	 */
	public String manage() {
		Power power=powerService.getById(2);
		List<PowerKey> keys=powerKeyService.findAll();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", power);
		stack.set("key", keys);
		return "manage";
	}
	
	/**
	 * 学校权限管理
	 * @return
	 */
	public String master() {
		Power power=powerService.getById(3);
		List<PowerKey> keys=powerKeyService.findAll();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", power);
		stack.set("key", keys);
		return "master";
	}
	
	/**
	 * 教师权限管理
	 * @return
	 */
	public String teacher() {
		Power power=powerService.getById(4);
		List<PowerKey> keys=powerKeyService.findAll();
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("bean", power);
		stack.set("key", keys);
		return "teacher";
	}
	
	/**
	 * 更新权限
	 * @return
	 */
	public String update(){
		if(getModel().getId()==2){
			updates();
			return manage();
		}else if(getModel().getId()==3){
			updates();
			return master();
		}else if(getModel().getId()==4){
			updates();
			return teacher();
		}
		return "input";
	}
	
	/**
	 * 更新功能
	 * @return
	 */
	private void updates(){
		Power power=powerService.getById(getModel().getId());
		power.setSelf(powerKeyService.getById(self_id));
		power.setSubs(powerKeyService.getById(subs_id));
		power.setStus(powerKeyService.getById(stus_id));
		powerService.update(power);
		addActionMessage("修改成功！");
	}
	
}
