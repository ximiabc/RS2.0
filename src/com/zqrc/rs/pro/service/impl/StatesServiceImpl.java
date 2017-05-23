package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.States;
import com.zqrc.rs.pro.service.StatesService;

/**
 * 学生报名状态事务
 * @author 李志飞
 *
 */
@Service
@Transactional
public class StatesServiceImpl extends BaseDaoImpl<States> implements StatesService{
}
