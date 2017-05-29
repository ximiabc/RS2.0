package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.User;
import com.zqrc.rs.pro.service.UserService;

/**
 * 用户事务
 * @author 李志飞
 *
 */
@Service
@Transactional
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService{

	/**
	 * 用户登录
	 */
	public User login(String account, String pass) {
		return (User)getSession().createQuery("from User u where u.account = ? and u.pass = ?").setString(0, account).setString(1,pass).uniqueResult();
	}
}
