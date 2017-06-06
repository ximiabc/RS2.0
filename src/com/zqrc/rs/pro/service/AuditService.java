package com.zqrc.rs.pro.service;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.Audit;

/**
 * 审核字段
 * @author JiaQi
 *
 */
public interface AuditService extends BaseDao<Audit>{

//	获取制定对象
	Audit findByComposite(Integer grade,Integer type,Integer year);
	
}
