package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.po.TUser;
import com.zs.pms.service.ArticleService;
import com.zs.pms.service.ChannelService;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryChannel;


@Controller//控制器
public class ArticleController {
	@Autowired//注入业务
	ArticleService as;
	@Autowired//注入业务
	ChannelService cs;
	
	@RequestMapping("/article/list.do")//url
	public String queryByCon(QueryArticle query,String currentPage,ModelMap map){
		QueryChannel channel=new QueryChannel();
		//获得所有的栏目 用于查询
		List<TChannel> channels = cs.queryByCon(channel);
		map.addAttribute("channels", channels);
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
		
		List<TArticle> articles = as.queryByPage(query, query.getPage());
		
		//获取总页数
		int pageCount = as.queryPageCount(query);
		//将当前页和总页面放到作用域
		map.addAttribute("currentPage", query.getPage());
		map.addAttribute("pageCount", pageCount);
		//将模糊条件放到作用域
		map.addAttribute("mohutitle", mohutitle);
		map.addAttribute("channel",query.getChannel());
		map.addAttribute("isremod",query.getIsremod());
		map.addAttribute("ishot",query.getIshot());
		//将List放到req的作用域中
		map.addAttribute("articles", articles);
		//转发
		return "article/list";
	}
	
	@RequestMapping("/article/toadd.do")//跳转到新增页面
	public String toadd(ModelMap map){
		QueryChannel channel=new QueryChannel();
		//获得所有的栏目
		List<TChannel> channels = cs.queryByCon(channel);
		map.addAttribute("channels", channels);
		return "article/add";
	}
	
	
	
	
	@RequestMapping("/article/add.do")//新增
	public String insert(TArticle article,ModelMap map,HttpSession session){
		
		try {
			//获得session中的对象 作为创建人
			TUser cuser=(TUser) session.getAttribute("userBean");
			article.setCreator(cuser.getId());
			
			as.insert(article);//新增
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return this.toadd(map);
		}
	}
	
	
	
	@RequestMapping("/article/delete.do")//删除
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
	@RequestMapping("/article/deletes.do")//批量删除
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
	
	
	@RequestMapping("/article/get.do")//获得要修改的信息
	public String get(int id,ModelMap map){
		TArticle article=as.queryById(id);//通过id获得
		map.addAttribute("article", article);//把要修改的用户放到作用域
		QueryChannel channel=new QueryChannel();
		//获得所有的栏目
		List<TChannel> channels = cs.queryByCon(channel);
		map.addAttribute("channels", channels);
		return "article/update";
		
	}
	@RequestMapping("/article/update.do")//修改
	public String update(TArticle article,HttpSession session,ModelMap map){
		//获得sessin的信息
		TUser cuser=(TUser) session.getAttribute("userBean");
		article.setUpdator(cuser.getId());
		try {
			as.update(article);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//发生异常重新 调用get()方法重新 修改
			return get(article.getId(), map);
		}
		
		
	}
	
}
