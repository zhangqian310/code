package pms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestArticle {
	@Autowired
	ArticleService as;
	
	public void testInsert(){
		TArticle article=new TArticle();
		article.setAuthor("a");
		TChannel channel=new TChannel();
		channel.setId(1);
		article.setChannel(channel);
		article.setContent("aaa");
		
		article.setCreator(1);
		article.setCrtime(new Date());
		article.setIshot(1);
		article.setIsremod(1);
		article.setTitle("a");
		try {
			as.insert(article);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public void testUpdate(){
		TArticle article=new TArticle();
		article.setId(11);
		article.setAuthor("a1");
		TChannel channel=new TChannel();
		channel.setId(1);
		article.setChannel(channel);
		article.setContent("aaa1");
		
		article.setUpdator(2);
		article.setCrtime(new Date());
		article.setIshot(1);
		article.setIsremod(1);
		article.setTitle("a1");
		try {
			as.update(article);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test 
	public void testPage(){
		QueryArticle query=new QueryArticle();
		query.setChannel(1);
		System.out.println(as.queryPageCount(query));
		as.queryByPage(query, 2);
		as.queryByCon(query);
		as.queryById(1);
		
		
	}
	
	public void testDelete(){
		try {
			as.deleteById(12);
			int ids[]={2,9};
			as.deleteByIds(ids);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}

