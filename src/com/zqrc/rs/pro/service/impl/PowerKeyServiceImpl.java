package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.PowerKey;
import com.zqrc.rs.pro.service.PowerKeyService;

/**
 * 用户权限值字段
 * @author 李志飞
 *
 */
@Service
@Transactional
public class PowerKeyServiceImpl extends BaseDaoImpl<PowerKey> implements PowerKeyService{
}
