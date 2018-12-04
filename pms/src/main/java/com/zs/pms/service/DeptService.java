package com.zs.pms.service;

import java.util.List;

import com.zs.pms.po.TDep;

public interface DeptService {
	//通过上级id获取
	public List<TDep> queryByPid(int pid);
	
}
