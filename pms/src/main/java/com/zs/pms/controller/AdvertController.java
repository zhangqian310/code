package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TAdvert;
import com.zs.pms.po.TUser;
import com.zs.pms.service.AdvertService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryAdvert;
import com.zs.pms.vo.QueryUser;


@Controller//控制器
public class AdvertController {
	@Autowired//注入业务
	AdvertService as;
	@Autowired//注入业务
	UserService us;
	
	@RequestMapping("/advert/list.do")//url
	public String queryByCon(QueryAdvert query,String currentPage,ModelMap map){
		QueryUser user=new QueryUser();
		//获得所有的用户 用于查询
		List<TUser> users = us.queryByCon(user);
		map.addAttribute("users", users);
		//模糊查询条件
		String mohutitle=query.getMohutitle();
		if (mohutitle!=null&&mohutitle!="") {
			query.setMohutitle("%"+query.getMohutitle()+"%");
		}
		
		//默认第一页
		query.setPage(1);
		//调用业务逻辑处理层的queryByPage方法
		if (currentPage!=null&&currentPage!="") {
			query.setPage(Integer.parseInt(currentPage));
		}
		
		List<TAdvert> adverts = as.queryByPage(query, query.getPage());
		
		//获取总页数
		int pageCount = as.queryPageCount(query);
		//将当前页和总页面放到作用域
		map.addAttribute("currentPage", query.getPage());
		map.addAttribute("pageCount", pageCount);
		//将模糊条件放到作用域
		map.addAttribute("mohutitle", mohutitle);
		map.addAttribute("creator", query.getCreator());
		//将List<TAdvert>放到req的作用域中
		map.addAttribute("adverts", adverts);
		//转发
		return "advert/list";
	}
	
	@RequestMapping("/advert/toadd.do")//跳转到新增页面
	public String toadd(ModelMap map){
		
		return "advert/add";
	}
	
	
	
	
	@RequestMapping("/advert/add.do")//新增
	public String insert(TAdvert advert,ModelMap map,HttpSession session){
		
		try {
			//获得session中的对象 作为创建人
			TUser cuser=(TUser) session.getAttribute("userBean");
			advert.setCreator(cuser.getId());
			
			as.insert(advert);//新增
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return this.toadd(map);
		}
	}
	
	
	
	@RequestMapping("/advert/delete.do")//删除
	public String delete(int id){
		//删除一条
		try {
			as.deleteById(id);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//跳转到指定url 不需要传参
		return "redirect:list.do";
	}
	@RequestMapping("/advert/deletes.do")//批量删除
	public String deletes(int[] ids){
		//批量删除
		try {
			as.deleteByIds(ids);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//跳转到指定url 不需要传参
		return "redirect:list.do";
	}
	
	
	@RequestMapping("/advert/get.do")//获得要修改的信息
	public String get(int id,ModelMap map){
		TAdvert advert=as.queryById(id);//通过id获得
		map.addAttribute("advert", advert);//把要修改的用户放到作用域
		
		return "advert/update";
		
	}
	@RequestMapping("/advert/update.do")//修改
	public String update(TAdvert advert,HttpSession session,ModelMap map){
		//获得sessin的信息
		TUser cuser=(TUser) session.getAttribute("userBean");
		advert.setUpdator(cuser.getId());
		try {
			as.update(advert);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//发生异常重新 调用get()方法重新 修改
			return get(advert.getId(), map);
		}
		
		
	}
	
}
