package com.zqrc.rs.pro.service.impl;

import java.util.List;

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

	/**
	 * 账号查找
	 */
	public User findByAccount(String account) {
		return (User)getSession().createQuery("from User u where u.account = ? ").setString(0, account).uniqueResult();
	}

	/**
	 * 获取所有学校
	 */
	public List<User> getAllSchool() {
		return (List<User>)getSession().createQuery("from User u where u.role.value = ? ").setInteger(0, 3).list();
	}

	/**
	 * 获取指定学历的所有学校
	 */
	public List<User> getSchoolByGrade(Integer grade) {
		return (List<User>)getSession().createQuery("from User u where u.role.value = ? and u.grade.id = ? ").setInteger(0, 3).setInteger(1, grade).list();
	}

	/**
	 * 通过下级的ID获取当前
	 */
	@Deprecated
	public User getUpUserById(Integer id) {
		return (User)getSession().createQuery("from User u where u.users.id = ? ").setInteger(0, id).uniqueResult();
	}
}
