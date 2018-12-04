package com.zs.pms.service;


import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TChannel;
import com.zs.pms.vo.QueryChannel;


public interface ChannelService {
	
	//条件查询
	public List<TChannel> queryByCon(QueryChannel query);
	//批量删除
	public void deleteByIds(int[] ids) throws AppException;
	//修改
	public void update(TChannel channel) throws AppException;
	//新增
	public int insert(TChannel channel) throws AppException;
	//删除
	public void deleteById(int id) throws AppException;
	//通过id查询
	public TChannel queryById(int id);
	//分页查询
	public List<TChannel> queryByPage(QueryChannel query,int page);
	//查询总页数
	public int queryPageCount(QueryChannel query);
}
