package com.zqrc.rs.pro.service;

import java.util.List;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.User;


/**
 * 用户事务
 * @author 李志飞
 *
 */
public interface UserService extends BaseDao<User>{
	
	User login(String account,String pass);
	
	User findByAccount(String account);
	
	List<User> getAllSchool();
	
	List<User> getSchoolByGrade(Integer grade);
}
