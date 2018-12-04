package com.zs.pms.service;


import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TAdvert;
import com.zs.pms.vo.QueryAdvert;


public interface AdvertService {
	
	//条件查询
	public List<TAdvert> queryByCon(QueryAdvert query);
	//批量删除
	public void deleteByIds(int[] ids) throws AppException;
	//修改
	public void update(TAdvert advert) throws AppException;
	//新增
	public int insert(TAdvert advert) throws AppException;
	//删除
	public void deleteById(int id) throws AppException;
	//通过id查询
	public TAdvert queryById(int id);
	//分页查询
	public List<TAdvert> queryByPage(QueryAdvert query,int page);
	//查询总页数
	public int queryPageCount(QueryAdvert query);
}
