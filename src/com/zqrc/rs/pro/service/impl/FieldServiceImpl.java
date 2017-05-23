package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.service.FieldService;

/**
 * 学生属性字段
 * @author 李志飞
 *
 */
@Service
@Transactional
public class FieldServiceImpl extends BaseDaoImpl<Fields> implements FieldService{
}
