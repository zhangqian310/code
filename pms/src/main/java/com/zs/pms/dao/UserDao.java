package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

/**用户表数据接口
 * @author Administrator
 *
 */
public interface UserDao {
	//条件查询
	public List<TUser> queryByCon(QueryUser query);
	//分页查询
	public List<TUser> queryByPage(QueryUser query);
	//通过id查询
	public TUser queryById(int id);
	//批量删除
	public void deleteByIds(int[] ids);
	//修改
	public void update(TUser user);
	//新增
	public int insert(TUser user);
	//删除
	public void deleteById(int id);
	//查询总条数
	public int queryCount(QueryUser query);
	
	
}
