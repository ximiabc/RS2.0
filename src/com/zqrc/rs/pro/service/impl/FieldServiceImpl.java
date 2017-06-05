package com.zqrc.rs.pro.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.service.FieldService;

/**
 * 学生属性字段
 * @author 李志飞
 *
 */
@Service
@Transactional
public class FieldServiceImpl extends BaseDaoImpl<Fields> implements FieldService{

	/**
	 * 获取对应的字段集合
	 */
	public List<Fields> getByComposite(Integer grade, Integer type, Integer year) {
		return (List<Fields>)getSession().createQuery("from Fields f where f.grade_id = ? and f.type_id = ? and f.year_id = ? order by f.orders asc").setInteger(0, grade).setInteger(1, type).setInteger(2, year).list();
	}
<<<<<<< HEAD
	
=======

	/**
	 * 删除指定记录
	 */
	public void delByComposite(Integer grade, Integer type, Integer year,Integer orders) {
		getSession().createQuery("Delete FROM Fields f Where f.grade_id = ? and f.type_id = ? and f.year_id = ? and f.orders = ?").setInteger(0, grade).setInteger(1, type).setInteger(2, year).setInteger(3, orders).executeUpdate();
	}
>>>>>>> refs/remotes/origin/master
}
