package pms;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml")//引入配置文件
public class TestUser {
	@Autowired
	UserService us;

	public void testLogin(){
		QueryUser query=new QueryUser();
		query.setLoginname("test1");
		query.setPassword("111");
		try {
			TUser user = us.chkLogin(query);
			System.out.println(user.getRelname()+user.getDept().getName());
			for (TPermission permission : user.getPermissions()) {
				System.out.println(permission.getPname());
			}
			System.out.println("------------整理好的菜单------------");
			for(TPermission per1 : user.getMenu()){
				System.out.println(per1.getPname());
				for (TPermission per2 : per1.getChild()) {
					System.out.println("\t"+per2.getPname());
				}
			}
		} catch (AppException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getErrMsg());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void testQuery(){
		QueryUser query=new QueryUser();
		query.setLoginname("test1");
		query.setPassword("111");
		//query.setIsenabled(1);
		//query.setPage(2);//当前页
		us.queryByCon(query);
		
	}
	
	
	public void testDelete(){
		int [] ids={3094,3095};
		try {
			us.deleteByIds(ids);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void testUpdate(){
		TUser user=new TUser();
		user.setId(3093);
		//user.setBirthday(new Date());
		//部门
		TDep dept=new TDep();
		dept.setId(6);
		//user.setDept(dept);
		//user.setEmail("qwe@123.com");
		user.setIsenabled(-1);
		//user.setPassword("321");
		//user.setPic("aaa.jpg");
		//user.setRelname("测试测试");
		user.setSex("女");
		user.setUpdator(1001);
		try {
			us.update(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public void testInsert(){
		TUser user=new TUser();
		
		user.setBirthday(new Date());
		//部门
		TDep dept=new TDep();
		dept.setId(6);
		user.setDept(dept);
		user.setEmail("qwe@123.com");
		user.setLoginname("test66");
		user.setPassword("321");
		user.setPic("aaa.jpg");
		user.setRelname("测试1");
		user.setSex("女");
		user.setCreator(1000);
		try {
			us.insert(user);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void test1(){
		TUser user = us.queryById(5001);
		System.out.println(user.getId());
//		QueryUser query=new QueryUser();
//		
//		List<TUser> queryByPage = us.queryByPage(query, 2);
//		System.out.println(us.queryPageCount(query));
//		for (TUser tUser : queryByPage) {
//			System.out.println(tUser.getId());
//		}
	}
	
}
