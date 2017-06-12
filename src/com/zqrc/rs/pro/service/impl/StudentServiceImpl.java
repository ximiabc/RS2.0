package com.zqrc.rs.pro.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.base.BaseDaoImpl;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.Student;
import com.zqrc.rs.pro.service.StudentService;

/**
 * 学生事务
 * 
 * @author 李志飞
 * 
 */
@Service
@Transactional
public class StudentServiceImpl extends BaseDaoImpl<Student> implements
		StudentService {
	// 获取制定id的属性
	public Map<String, String> findStudentMap(Integer id) {
		Map<String, String> stu_map = new HashMap<String,String>();
		
		Student student = (Student)getSession().createQuery("from Student s where s.id = ?").setInteger(0, id).uniqueResult();		
		
		stu_map.put("item1", student.getItem1());
		stu_map.put("item2", student.getItem2());
		stu_map.put("item3", student.getItem3());
		stu_map.put("item4", student.getItem4());
		stu_map.put("item5", student.getItem5());
		stu_map.put("item6", student.getItem6());
		stu_map.put("item7", student.getItem7());
		stu_map.put("item8", student.getItem8());
		stu_map.put("item9", student.getItem9());
		stu_map.put("item10", student.getItem10());
		stu_map.put("item11", student.getItem11());
		stu_map.put("item12", student.getItem12());
		stu_map.put("item13", student.getItem13());
		stu_map.put("item14", student.getItem14());
		stu_map.put("item15", student.getItem15());
		stu_map.put("item16", student.getItem16());
		stu_map.put("item17", student.getItem17());
		stu_map.put("item18", student.getItem18());
		stu_map.put("item19", student.getItem19());
		stu_map.put("item20", student.getItem20());
		stu_map.put("item21", student.getItem21());
		stu_map.put("item22", student.getItem22());
		stu_map.put("item23", student.getItem23());
		stu_map.put("item24", student.getItem24());
		stu_map.put("item25", student.getItem25());
		stu_map.put("item26", student.getItem26());
		stu_map.put("item27", student.getItem27());
		stu_map.put("item28", student.getItem28());
		stu_map.put("item29", student.getItem29());
		stu_map.put("item30", student.getItem30());
		stu_map.put("item31", student.getItem31());
		stu_map.put("item32", student.getItem32());
		stu_map.put("item33", student.getItem33());
		stu_map.put("item34", student.getItem34());
		stu_map.put("item35", student.getItem35());
		stu_map.put("item36", student.getItem36());
		stu_map.put("item37", student.getItem37());
		stu_map.put("item38", student.getItem38());
		stu_map.put("item39", student.getItem39());
		stu_map.put("item40", student.getItem40());
		
		return stu_map;
	}

	public Integer getPrimaryReal(Integer year) {
		return getSession().createQuery("from Student s where s.grade.id = ? and s.years.id = ? and s.states.id = ?").setInteger(0, 1).setInteger(1, year).setInteger(2, 1) .list().size();
	}

	public Integer getMiddleReal(Integer year) {
		return getSession().createQuery("from Student s where s.grade.id = ? and s.years.id = ? and s.states.id = ?").setInteger(0, 2).setInteger(1, year).setInteger(2, 1) .list().size();
	}

}
