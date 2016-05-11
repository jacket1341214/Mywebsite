package com.jacket.webapp.user.service;

import com.github.abel533.mapper.Mapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.user.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public abstract class BaseService<T> {

	@Autowired
	protected Mapper<T> mapper;

	@Transactional(readOnly = false)
	public int save(T entity) {
		return mapper.insertSelective(entity);
	}

	@Transactional(readOnly = false)
	 public int deleteByExample(T entity) {
		return mapper.deleteByExample(entity);
	}
	@Transactional(readOnly = false)
	public int delete(T entity) {
		return mapper.deleteByPrimaryKey(entity);
	}

	@Transactional(readOnly = false)
	public int deleteByPrimaryKey(Object id) {
		return mapper.deleteByPrimaryKey(id);
	}

	@Transactional(readOnly = false)
	public int update(T entity) {
		return mapper.updateByPrimaryKeySelective(entity);
	}

	@Transactional(readOnly = true)
	public T getOne(Object id) {
		return mapper.selectByPrimaryKey(id);
	}

	/**
	 * 单表分页查询
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<T> selectPage(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		// Spring4支持泛型注入
		return mapper.select(null);
	}
	@Transactional(readOnly = true)
	public PageInfo<T> selectPage2(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<T>(mapper.select(null));
	}

	/**
	 * 查询全部
	 * 
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<T> queryAll() {
		return mapper.select(null);
	}
	@Transactional(readOnly = false)
	public int updateById(T t) {
		return mapper.updateByPrimaryKeySelective(t);
	}


}