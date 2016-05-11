package com.jacket.webapp.user.service;

import java.util.List;

/**
 * Created by bf730 on 2015/8/21.
 */
public interface IBaseService<T> {
    public int save(T entity);

    public int delete(T entity);

    public int update(T entity);

    public T getOne(Object id);


    public List<T> selectPage(int pageNum, int pageSize);


    public List<T> queryAll();

    public int updateById(T t);
}
