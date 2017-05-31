package com.zqrc.rs.pro.service.impl;

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
}
