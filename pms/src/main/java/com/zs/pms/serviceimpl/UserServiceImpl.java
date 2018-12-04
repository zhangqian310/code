package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.Constants;
import com.zs.pms.util.MD5;
import com.zs.pms.vo.QueryUser;
@Service
@Transactional  //该业务支持事务
public class UserServiceImpl implements UserService {
	@Autowired //按类型自动装配
	private UserDao ud;
	
//	@Autowired
//	private UserDao2 ud2;
	
	@Override
	public TUser chkLogin(QueryUser query) throws AppException {
		// TODO Auto-generated method stub
		
		//获取明码
		String mm=query.getPassword();
		//将明码转换为密码
		MD5 md5=new MD5();
		//加密后的密码
		query.setPassword(md5.getMD5ofStr(query.getPassword()));
		
		//条件查询
		List<TUser> list = ud.queryByCon(query);
		//没有该用户
		if (list==null||list.size()!=1) {
			throw new AppException(1000, "用户名或密码输入错误，请重新输入");
		}
		//获得第一条
		TUser user = list.get(0);
		//把明码放回query
		query.setPassword(mm);
		//关联权限列表返回     调用通过id查询
		return ud.queryById(user.getId());
	}

	@Override//条件查询
	public List<TUser> queryByCon(QueryUser query) {
		// TODO Auto-generated method stub
		
		return ud.queryByCon(query);
	}

	@Override//批量删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteByIds(int[] ids) throws AppException {
		// TODO Auto-generated method stub
		ud.deleteByIds(ids);
	}

	@Override//修改
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void update(TUser user) throws AppException {
		// TODO Auto-generated method stub
		//不可用
		if (user.getIsenabled()==-1) {
			throw new AppException(1002, "不能修改不可用的用户");
		}
		//获得原来的用户
		TUser ouser = ud.queryById(user.getId());
		if(user.getPassword()!=null&&(!"".equals(user.getPassword()))&&!user.getPassword().equals(ouser.getPassword())){
			//密码加密
			MD5 md5=new MD5();
			user.setPassword(md5.getMD5ofStr(user.getPassword()));
		}
		ud.update(user);
	}

	@Override//新增
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public int insert(TUser user) throws AppException {
		// TODO Auto-generated method stub
		//不开事务成功一条        开启事务一条都不成功
		//ud.insert(user);
		//int i=1/0;//抛异常
		if ("admins".equals(user.getLoginname())) {
			throw new AppException(1003, "用户名不能为admins");
		}
		//加密
		MD5 md5=new MD5();
		user.setPassword(md5.getMD5ofStr(user.getPassword()));
		return ud.insert(user);
	}

	@Override//通过id删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteById(int id) throws AppException {
		// TODO Auto-generated method stub
		ud.deleteById(id);
	}

	@Override//通过id查询
	public TUser queryById(int id) {
		// TODO Auto-generated method stub
		return ud.queryById(id);
	}

	/**
	 * query：条件  page:当前页
	 */
	@Override
	public List<TUser> queryByPage(QueryUser query,int page) {
		// TODO Auto-generated method stub
		//把当前页设置到条件中
		query.setPage(page);
		//可以设置起始值和截止
		
		return ud.queryByPage(query);
	}

	@Override
	/**
	 * 计算总页数
	 */
	public int queryPageCount(QueryUser query) {
		// TODO Auto-generated method stub
		//获得总条数
		int count=ud.queryCount(query);
		if (count%Constants.PAGECOUNT==0) {//能整除
			return count/Constants.PAGECOUNT;
		} else {//不能整除
			return count/Constants.PAGECOUNT+1;
		}
		
	}

}
