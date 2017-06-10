package com.zqrc.rs.pro.service;

import java.util.Map;

import com.zqrc.rs.base.BaseDao;
import com.zqrc.rs.pro.entity.Student;

/**
 * 学生事务
 * @author 李志飞
 *
 */
public interface StudentService extends BaseDao<Student>{
//	获取制定id的属性
	Map<String,String> findStudentMap(Integer id);
}
