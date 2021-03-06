package com.zqrc.rs.pro.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.service.YearService;

/**
 * 学生届别
 * @author 李志飞
 *
 */
@Service
@Transactional
public class YearServiceImpl extends BaseDaoImpl<SchoolYear> implements YearService{

	/**
	 * 获取最新的一年
	 */
	public SchoolYear getNews() {
		return (SchoolYear)getSession().createQuery("from SchoolYear s order by s.date desc").list().get(0);
	}

	public List<SchoolYear> getAllByNews() {
		return (List<SchoolYear>)getSession().createQuery("from SchoolYear s order by s.date desc").list();
	}
	
	
}
