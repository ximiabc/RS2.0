package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.service.DueTimeService;

/**
 * 学生报名日期
 * @author 李志飞
 *
 */
@Service
@Transactional
public class DueTimeServiceImpl extends BaseDaoImpl<DueTime> implements DueTimeService{

	/**
	 * 通过联合主键获取报名日期
	 */
	public DueTime getByComposite(Integer grade, Integer type, Integer year) {
		return (DueTime)getSession().createQuery("from DueTime d where d.grade_id = ? and d.type_id = ? and d.year_id = ?").setInteger(0, grade).setInteger(1, type).setInteger(2, year).uniqueResult();
	}
}
