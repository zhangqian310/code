package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;


@Controller//控制器
public class UserController {
	@Autowired//注入业务
	UserService us;
	@Autowired
	DeptService ds;
	
	@RequestMapping("/login.do")//url
	public String login(QueryUser query,ModelMap map,HttpSession session,HttpServletResponse resp){
		//创建查询对象
		try {
			//获取图片的验证码
			String code=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			//判断
			if (!code.equals(query.getChkcode())) {
				System.out.println(query.getChkcode());
				//验证失败
				map.addAttribute("msg", "验证码有误，请重新输入");
				//转发
				return "login";
				//session.setAttribute("msg", "验证码有误，请重新输入");
				//重定向到登录页	
				//return "redirect:login.jsp";
				
			}
			//调用登录方法判断是否登录成功
			TUser chkLogin = us.chkLogin(query);
			
			//登陆成功把 登录信息放到session中
			//session.setAttribute("time", new Date());
			session.setAttribute("userBean", chkLogin);
			// 判断是否记住密码 --要判空否则会报错
			if (query.getRem() != null && query.getRem().equals("1")) {
				// 创建cookie 记住账号密码
				Cookie cookie1 = new Cookie("loginname", query.getLoginname());
				Cookie cookie2 = new Cookie("password", query.getPassword());
				// 设置cookie的有效时长
				cookie1.setMaxAge(60);
				cookie2.setMaxAge(60);
				// 将cookie响应给浏览器
				resp.addCookie(cookie1);
				resp.addCookie(cookie2);
			}
//			// 转发主页面
			return "main";
				

		} catch (AppException e) {
			// TODO Auto-generated catch block
			// 登录失败提示
			map.addAttribute("msg", e.getErrMsg()) ;
			//转发
			return "login";
			//session.setAttribute("msg", e.getErrMsg());
			//重定向到登录页
			//return "redirect:login.jsp";
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//错误页面
			return "error";
			
		}
		
	}
	
	
	@RequestMapping("/user/list.do")//url
	public String queryByCon(QueryUser query,String currentPage,ModelMap map){
		
		String mhname=query.getMohuname();
		if (mhname!=null&&mhname!="") {
			query.setMohuname("%"+query.getMohuname()+"%");
		}
		
		//默认第一页
		query.setPage(1);
		//调用业务逻辑处理层的queryByPage方法
		if (currentPage!=null&&currentPage!="") {
			query.setPage(Integer.parseInt(currentPage));
		}
		
		List<TUser> users = us.queryByPage(query, query.getPage());
		
		//获取总页数
		int pageCount = us.queryPageCount(query);
		//将当前页和总页面放到作用域
		map.addAttribute("currentPage", query.getPage());
		map.addAttribute("pageCount", pageCount);
		//将模糊条件放到作用域
		map.addAttribute("mohuname", mhname);
		map.addAttribute("mohuenabled", query.getMohuenabled());
		//将List<UserBean>放到req的作用域中
		map.addAttribute("users", users);
		//转发
		return "user/list";
	}
	
	@RequestMapping("/user/toadd.do")
	public String toadd(ModelMap map){
		//获得一级部门
		List<TDep> list1 = ds.queryByPid(0);
		map.addAttribute("DLIST", list1);
		//获得默认一级部门下的二级部门
		List<TDep> list2 = ds.queryByPid(list1.get(0).getId());
		map.addAttribute("DLIST2", list2);
		return "user/add";
	}
	
	@RequestMapping("/user/getdept.do")//ajax二级联动获得二级部门 不需要跳转页面  返回二级部门
	@ResponseBody	//以ajax方式响应   方法返回string 'text' 直接返回文本  方法返回对象 'json' list自动转json
	public List<TDep> getDepts(String pid,HttpServletResponse resp){
		//System.out.println(pid);
		//获得二级部门
		List<TDep> list = ds.queryByPid(Integer.parseInt(pid));
		//集合转为json数组
//		JSONArray jsa = JSONArray.fromObject(list);
//		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("application/json");
//		try {
//			//服务器响应给客户端的数据内容
//			resp.getWriter().write(jsa.toString());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//返回二级部门
		return list;
		
	}
	
	
	@RequestMapping("/user/add.do")//新增
	public String insert(TUser user,ModelMap map,HttpSession session){
		
		try {
			//获得session中的对象 作为创建人
			TUser cuser=(TUser) session.getAttribute("userBean");
			user.setCreator(cuser.getId());
			user.setIsenabled(1);//可以
			//user.setPic("");//图片路径
			us.insert(user);//新增
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return this.toadd(map);
		}
	}
	//ajax判断用户是否存在
	@RequestMapping("/user/chkuser.do")
	@ResponseBody
	public String chkuser(String loginname){
		QueryUser query=new QueryUser();
		query.setLoginname(loginname);
		//调用条件查询
		List<TUser> users = us.queryByCon(query);
		if (users==null||users.size()==0) {
			return "true";//表示没有重复
		}
		return "false";
		
	}
	//ajax判断邮箱是否存在
	@RequestMapping("/user/chkemail.do")
	@ResponseBody
	public String chkemail(String email){
		QueryUser query=new QueryUser();
		query.setEmail(email);
		//调用条件查询
		List<TUser> users = us.queryByCon(query);
		if (users==null||users.size()==0) {
			return "true";//表示没有重复
		}
		return "false";
			
	}
	
	
	
	@RequestMapping("/user/delete.do")//删除
	public String delete(int id){
		//删除一条
		try {
			us.deleteById(id);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//跳转到指定url 不需要传参
		return "redirect:list.do";
	}
	@RequestMapping("/user/deletes.do")//批量删除
	public String deletes(int[] ids){
		//批量删除
		try {
			us.deleteByIds(ids);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//跳转到指定url 不需要传参
		return "redirect:list.do";
	}
	
	
	@RequestMapping("/user/get.do")//获得要修改的用户的信息
	public String get(int id,ModelMap map){
		TUser user=us.queryById(id);//通过id获得用户
		map.addAttribute("user", user);//把要修改的用户放到作用域
		//获得一级部门
		List<TDep> list1=ds.queryByPid(0);
		map.addAttribute("DLIST", list1);
		//获得该用户一级部门下的二级部门
		List<TDep> list2 = ds.queryByPid(user.getDept().getPid());
		map.addAttribute("DLIST2", list2);
		return "user/update";
		
	}
	@RequestMapping("/user/update.do")//修改
	public String update(TUser user,HttpSession session,ModelMap map){
		//获得sessin的信息
		TUser cuser=(TUser) session.getAttribute("userBean");
		user.setUpdator(cuser.getId());
		try {
			us.update(user);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//发生异常重新 调用get()方法重新 修改
			return get(user.getId(), map);
		}
		
		
	}
	
}
