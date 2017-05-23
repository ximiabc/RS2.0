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
}
