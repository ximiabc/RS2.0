package com.zqrc.rs.pro.service;

import java.util.List;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.SchoolYear;

/**
 * 学生届别
 * @author 李志飞
 *
 */
public interface YearService extends BaseDao<SchoolYear>{
	SchoolYear getNews();
	
	List<SchoolYear> getAllByNews();
}
