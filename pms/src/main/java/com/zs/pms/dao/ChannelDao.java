package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TChannel;
import com.zs.pms.vo.QueryChannel;

public interface ChannelDao {
	// 条件查询
	public List<TChannel> queryByCon(QueryChannel query);

	// 分页查询
	public List<TChannel> queryByPage(QueryChannel query);

	// 通过id查询
	public TChannel queryById(int id);

	// 批量删除
	public void deleteByIds(int[] ids);

	// 修改
	public void update(TChannel channel);

	// 新增
	public int insert(TChannel channel);

	// 删除
	public void deleteById(int id);

	// 查询总条数
	public int queryCount(QueryChannel query);
}
