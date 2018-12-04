package pms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TAdvert;
import com.zs.pms.service.AdvertService;
import com.zs.pms.vo.QueryAdvert;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestAdvert {
	
	@Autowired
	AdvertService as;
	
	public void testInsert(){
		TAdvert advert = new TAdvert();
		advert.setTitle("a");
		advert.setContent("aaa");
		//advert.setCreator(1000);
		try {
			as.insert(advert);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testQuery(){
		QueryAdvert query=new QueryAdvert();
		as.queryByPage(query, 1);
		as.queryPageCount(query);
	}
	
}
