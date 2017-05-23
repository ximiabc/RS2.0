package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Power;
import com.zqrc.rs.pro.service.PowerService;

/**
 * 用户权限
 * @author 李志飞
 *
 */
@Service
@Transactional
public class PowerServiceImpl extends BaseDaoImpl<Power> implements PowerService{
}
