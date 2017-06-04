package com.zqrc.rs.pro.service;

import java.util.List;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.Fields;

/**
 * 学生信息字段
 * @author 李志飞
 *
 */
public interface FieldService extends BaseDao<Fields>{
	/**
	 * 获取一组字段
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	List<Fields>getByComposite(Integer grade,Integer type,Integer year);
	
}
