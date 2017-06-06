package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Audit;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.service.AuditService;

/**
 * 审核字段
 * @author JiaQi
 *
 */
@Service
@Transactional
public class AuditServiceImpl extends BaseDaoImpl<Audit> implements AuditService{

	
	public Audit findByComposite(Integer grade, Integer type, Integer year) {
		return (Audit)getSession().createQuery("from Audit d where d.grade_id = ? and d.type_id = ? and d.year_id = ?").setInteger(0, grade).setInteger(1, type).setInteger(2, year).uniqueResult();
	}
	
}
