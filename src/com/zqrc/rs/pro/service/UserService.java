package com.zqrc.rs.pro.service;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.User;


/**
 * 用户事务
 * @author 李志飞
 *
 */
public interface UserService extends BaseDao<User>{
	
	User login(String account,String pass);
	
}
