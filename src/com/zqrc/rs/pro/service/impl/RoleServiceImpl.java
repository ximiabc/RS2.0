package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Role;
import com.zqrc.rs.pro.service.RoleService;

/**
 * 用户角色类型事务
 * @author 李志飞
 *
 */
@Service
@Transactional
public class RoleServiceImpl extends BaseDaoImpl<Role> implements RoleService{
}
