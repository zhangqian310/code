package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;

public interface ArticleDao {
	// 条件查询
	public List<TArticle> queryByCon(QueryArticle query);

	// 分页查询
	public List<TArticle> queryByPage(QueryArticle query);

	// 通过id查询
	public TArticle queryById(int id);

	// 批量删除
	public void deleteByIds(int[] ids);

	// 修改
	public void update(TArticle article);

	// 新增
	public int insert(TArticle article);

	// 删除
	public void deleteById(int id);

	// 查询总条数
	public int queryCount(QueryArticle query);
}
