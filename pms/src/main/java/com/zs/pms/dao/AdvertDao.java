package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TAdvert;
import com.zs.pms.vo.QueryAdvert;

public interface AdvertDao {
	// 条件查询
	public List<TAdvert> queryByCon(QueryAdvert query);

	// 分页查询
	public List<TAdvert> queryByPage(QueryAdvert query);

	// 通过id查询
	public TAdvert queryById(int id);

	// 批量删除
	public void deleteByIds(int[] ids);

	// 修改
	public void update(TAdvert advert);

	// 新增
	public int insert(TAdvert advert);

	// 删除
	public void deleteById(int id);

	// 查询总条数
	public int queryCount(QueryAdvert query);
}
