package com.zs.pms.service;


import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;


public interface ArticleService {
	
	//条件查询
	public List<TArticle> queryByCon(QueryArticle query);
	//批量删除
	public void deleteByIds(int[] ids) throws AppException;
	//修改
	public void update(TArticle article) throws AppException;
	//新增
	public int insert(TArticle article) throws AppException;
	//删除
	public void deleteById(int id) throws AppException;
	//通过id查询
	public TArticle queryById(int id);
	//分页查询
	public List<TArticle> queryByPage(QueryArticle query,int page);
	//查询总页数
	public int queryPageCount(QueryArticle query);
}
