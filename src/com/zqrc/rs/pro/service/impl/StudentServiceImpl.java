package com.zqrc.rs.pro.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Student;
import com.zqrc.rs.pro.service.StudentService;

/**
 * 学生事务
 * @author 李志飞
 *
 */
@Service
@Transactional
public class StudentServiceImpl extends BaseDaoImpl<Student> implements StudentService{
}
