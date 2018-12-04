package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.service.ArticleService;
import com.zs.pms.util.Constants;
import com.zs.pms.vo.QueryArticle;
@Service
@Transactional  //该业务支持事务
public class ArticleServiceImpl implements ArticleService {
	@Autowired //按类型自动装配
	private ArticleDao ad;
	

	@Override//条件查询
	public List<TArticle> queryByCon(QueryArticle query) {
		// TODO Auto-generated method stub
		
		return ad.queryByCon(query);
	}

	@Override//批量删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteByIds(int[] ids) throws AppException {
		// TODO Auto-generated method stub
		
		ad.deleteByIds(ids);
	}

	@Override//修改
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void update(TArticle article) throws AppException {
		// TODO Auto-generated method stub
		
		ad.update(article);
	}

	@Override//新增
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public int insert(TArticle article) throws AppException {
		// TODO Auto-generated method stub
		//不开事务成功一条        开启事务一条都不成功
		//ud.insert(user);
		//int i=1/0;//抛异常
		return ad.insert(article);
	}

	@Override//通过id删除
	@Transactional(rollbackFor=Exception.class)//有异常就回滚 否则提交
	public void deleteById(int id) throws AppException {
		// TODO Auto-generated method stub
		ad.deleteById(id);
	}

	@Override//通过id查询
	public TArticle queryById(int id) {
		// TODO Auto-generated method stub
		return ad.queryById(id);
	}

	/**
	 * query：条件  page:当前页
	 */
	@Override
	public List<TArticle> queryByPage(QueryArticle query,int page) {
		// TODO Auto-generated method stub
		//把当前页设置到条件中
		query.setPage(page);
		//可以设置起始值和截止
		
		return ad.queryByPage(query);
	}

	@Override
	/**
	 * 计算总页数
	 */
	public int queryPageCount(QueryArticle query) {
		// TODO Auto-generated method stub
		//获得总条数
		int count=ad.queryCount(query);
		if (count%Constants.PAGECOUNT==0) {//能整除
			return count/Constants.PAGECOUNT;
		} else {//不能整除
			return count/Constants.PAGECOUNT+1;
		}
		
	}

}
