package com.zs.pms.service;


import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	//检测登录
	public TUser chkLogin(QueryUser query) throws AppException;
	//条件查询
	public List<TUser> queryByCon(QueryUser query);
	//批量删除
	public void deleteByIds(int[] ids) throws AppException;
	//修改
	public void update(TUser user) throws AppException;
	//新增
	public int insert(TUser user) throws AppException;
	//删除
	public void deleteById(int id) throws AppException;
	//通过id查询
	public TUser queryById(int id);
	//分页查询
	public List<TUser> queryByPage(QueryUser query,int page);
	//查询总页数
	public int queryPageCount(QueryUser query);
}
