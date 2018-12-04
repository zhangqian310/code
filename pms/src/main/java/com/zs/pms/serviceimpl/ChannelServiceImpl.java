package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.zs.pms.dao.ChannelDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TChannel;
import com.zs.pms.service.ChannelService;
import com.zs.pms.util.Constants;
import com.zs.pms.vo.QueryChannel;
@Service
@Transactional  //该业务支持事务
public class ChannelServiceImpl implements ChannelService {
	@Autowired //按类型自动装配
	private ChannelDao cd;
//	@Autowired //按类型自动装配
//	private ArticleDao ad;

	@Override//条件查询
	public List<TChannel> queryByCon(QueryChannel query) {
		// TODO Auto-generated method stub
		
		return cd.queryByCon(query);
	}

	@Override//批量删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteByIds(int[] ids) throws AppException {
		// TODO Auto-generated method stub
		
		
		//将栏目id放到条件中
		for (int i : ids) {
			TChannel channel = cd.queryById(i);
			if (channel.getChild()!=null&&channel.getChild().size()!=0) {
				//有子栏目不能删除
				throw new AppException(2002, "该栏目下有子栏目不能删除");
			}
			if (channel.getArticles()!=null&&channel.getArticles().size()!=0) {
				//该栏目下有文章不能删除
				throw new AppException(2001, "该栏目下有文章不能删除");
			}
//			query.setChannel(i);
//			//调用articledao的条件查询
//			List<TArticle> list = ad.queryByCon(query);
//			if (list!=null&&list.size()!=0) {
//				//该栏目下有文章不能删除
//				throw new AppException(2001, "该栏目下有文章不能删除");
//			}
		}
		
		cd.deleteByIds(ids);
		
	}

	@Override//修改
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void update(TChannel channel) throws AppException {
		// TODO Auto-generated method stub
		
		cd.update(channel);
	}

	@Override//新增
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public int insert(TChannel channel) throws AppException {
		// TODO Auto-generated method stub
		//不开事务成功一条        开启事务一条都不成功
		//ud.insert(user);
		//int i=1/0;//抛异常
		return cd.insert(channel);
	}

	@Override//通过id删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteById(int id) throws AppException {
		// TODO Auto-generated method stub
		TChannel channel = cd.queryById(id);
		if (channel.getChild()!=null&&channel.getChild().size()!=0) {
			//有子栏目不能删除
			throw new AppException(2002, "该栏目下有子栏目不能删除");
		}
		if (channel.getArticles()!=null&&channel.getArticles().size()!=0) {
			//该栏目下有文章不能删除
			throw new AppException(2001, "该栏目下有文章不能删除");
		}
		
//		QueryArticle query=new QueryArticle();
//		//将栏目id放到条件中
//		query.setChannel(id);
//		//调用articledao的条件查询
//		List<TArticle> list = ad.queryByCon(query);
//		if (list!=null&&list.size()!=0) {
//			//该栏目下有文章不能删除
//			throw new AppException(2001, "该栏目下有文章不能删除");
//		}
		cd.deleteById(id);
	}

	@Override//通过id查询
	public TChannel queryById(int id) {
		// TODO Auto-generated method stub
		return cd.queryById(id);
	}

	/**
	 * query：条件  page:当前页
	 */
	@Override
	public List<TChannel> queryByPage(QueryChannel query,int page) {
		// TODO Auto-generated method stub
		//把当前页设置到条件中
		query.setPage(page);
		//可以设置起始值和截止
		
		return cd.queryByPage(query);
	}

	@Override
	/**
	 * 计算总页数
	 */
	public int queryPageCount(QueryChannel query) {
		// TODO Auto-generated method stub
		//获得总条数
		int count=cd.queryCount(query);
		if (count%Constants.PAGECOUNT==0) {//能整除
			return count/Constants.PAGECOUNT;
		} else {//不能整除
			return count/Constants.PAGECOUNT+1;
		}
		
	}

}
