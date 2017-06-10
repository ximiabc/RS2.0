package com.zqrc.rs.base;

import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.zqrc.rs.until.HqlHelper;
import com.zqrc.rs.until.PageBean;
/**
 * 数据访问接口的实�?
 * @author java_one
 *
 * @param <T>
 */
@Transactional
public abstract class BaseDaoImpl<T> implements BaseDao<T>{
	@Resource
	private SessionFactory sessionFactory;
	private Class<T> clazz;

	public BaseDaoImpl() {
		// 使用反射�?��得到T的真实类�?
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass(); // 获取当前new的对象的 泛型的父�?类型
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0]; // 获取第一个类型参数的真实类型
		/*System.out.println("clazz ---> " + clazz);*/
	}

	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(T entity) {
		getSession().save(entity);
	}
	
	public void saveOrUpdate(T entity) {
		getSession().saveOrUpdate(entity);
	}
	
	public void update(T entity) {
		getSession().update(entity);
	}
	
	public void delete(Integer id) {
		Object obj = getById(id);
		if (obj != null) {
			getSession().delete(obj);
		}
	}

	public T getById(Integer id) {
		if (id == null) {
			return null;
		} else {
			return (T) getSession().get(clazz, id);
		}
	}
	
	public T loadById(Integer id) {
		if (id == null) {
			return null;
		} else {
			T t=(T)getSession().load(clazz, id);
			if(t!=null){
				return t;
			}else{
				return getById(id);
			}
		}
	}

	public List<T> getByIds(Integer[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		} else {
			return getSession().createQuery(//
					"FROM " + clazz.getSimpleName() + " WHERE id IN (:ids)")//
					.setParameterList("ids", ids)//
					.list();
		}
	}

	public List<T> findAll() {
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName())//
				.list();
	}

	
	public PageBean getPageBean(int pageNum, int Pagesize, HqlHelper hqlHelper) {
		int pageSize = Pagesize;
		List<Object> parameters = hqlHelper.getParameterList();

		// 查询数据列表
		Query query = getSession().createQuery(hqlHelper.getQueryListHql()); // 生成查询对象
		if (parameters != null) {// 设置参数
			for (int i = 0; i < parameters.size(); i++) {
				query.setParameter(i, parameters.get(i));
			}
		}
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		List list = query.list(); // 执行查询

		// 查询总记录数
		Query countQuery = getSession().createQuery(hqlHelper.getQueryCountHql()); // 生成查询对象
		if (parameters != null) {// 设置参数
			for (int i = 0; i < parameters.size(); i++) {
				countQuery.setParameter(i, parameters.get(i));
			}
		}
		Long count = (Long) countQuery.uniqueResult(); // 执行查询

		return new PageBean(pageNum, pageSize, count.intValue(), list);
	}
}
	

