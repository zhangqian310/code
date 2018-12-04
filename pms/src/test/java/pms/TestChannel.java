package pms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.service.ChannelService;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestChannel {
	@Autowired
	ChannelService cs;
	
	@Test
	public void testDelete(){
		try {
			//cs.deleteById(1);
			int[] ids={3,1};
			cs.deleteByIds(ids);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getErrMsg());
		}
	}
	
}
