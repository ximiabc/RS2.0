package com.zqrc.rs.base;

import java.util.List;

import com.zqrc.rs.until.HqlHelper;
import com.zqrc.rs.until.PageBean;


/**
 * 数据访问接口
 * @author java_one
 *
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	void save(T entity);

	/**
	 * 删除实体
	 * 
	 * @param id
	 */
	void delete(Integer id);
	
	/**
	 * 保存或更新
	 * @param entity
	 */
	void saveOrUpdate(T entity);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 按id查询
	 * 
	 * @param id
	 * @return
	 */
	T getById(Integer id);
	
	/**
	 * 在池中加载数据
	 * 没有的话重新获取
	 * @param id
	 * @return
	 */
	T loadById(Integer id);

	/**
	 * 按id查询
	 * 
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Integer[] ids);

	/**
	 * 查询�?��
	 * 
	 * @return
	 */
	List<T> findAll();
	/**
	 * 分页信息，传进来的参数为  起始页，�?��显示多少
	 * 
	 */
	PageBean getPageBean(int pageNum,int Pagesize,HqlHelper hqlHelper);
}
