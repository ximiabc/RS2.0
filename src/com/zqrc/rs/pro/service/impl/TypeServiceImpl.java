package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Type;
import com.zqrc.rs.pro.service.TypeService;

/**
 * 范围内外类型事务
 * @author 李志飞
 *
 */
@Service
@Transactional
public class TypeServiceImpl extends BaseDaoImpl<Type> implements TypeService{
}
