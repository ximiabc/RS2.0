package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Checks;
import com.zqrc.rs.pro.service.ChecksService;

/**
 * 正则校验
 * @author 李志飞
 */
@Service
@Transactional
public class ChecksServiceImpl extends BaseDaoImpl<Checks> implements ChecksService{
}
