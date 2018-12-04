package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TChannel;
import com.zs.pms.po.TUser;
import com.zs.pms.service.ChannelService;
import com.zs.pms.vo.QueryChannel;


@Controller//控制器
public class ChannelController {
	
	@Autowired//注入业务
	ChannelService cs;
	
	@RequestMapping("/channel/list.do")//url
	public String queryByCon(QueryChannel query,String currentPage,ModelMap map){
		QueryChannel channel=new QueryChannel();
		channel.setIsleaf(-1);//不是叶子的可以作为上级id
		//获得所有的栏目 用于查询
		List<TChannel> pchannels = cs.queryByCon(channel);
		map.addAttribute("pchannels", pchannels);
		//模糊查询条件
		String mohucname=query.getMohucname();
		if (mohucname!=null&&mohucname!="") {
			query.setMohucname("%"+query.getMohucname()+"%");
		}
		
		//默认第一页
		query.setPage(1);
		//调用业务逻辑处理层的queryByPage方法
		if (currentPage!=null&&currentPage!="") {
			query.setPage(Integer.parseInt(currentPage));
		}
		
		List<TChannel> channels = cs.queryByPage(query, query.getPage());
		
		//获取总页数
		int pageCount = cs.queryPageCount(query);
		//将当前页和总页面放到作用域
		map.addAttribute("currentPage", query.getPage());
		map.addAttribute("pageCount", pageCount);
		//将模糊条件放到作用域
		map.addAttribute("mohucname", mohucname);
		map.addAttribute("pid",query.getPid());
		
		//将List放到req的作用域中
		map.addAttribute("channels", channels);
		//转发
		return "channel/list";
	}
	
	@RequestMapping("/channel/toadd.do")//跳转到新增页面
	public String toadd(ModelMap map){
		QueryChannel channel=new QueryChannel();
		channel.setIsleaf(-1);//不是叶子的可以作为上级id
		//获得所有的上级栏目
		List<TChannel> channels = cs.queryByCon(channel);
		map.addAttribute("channels", channels);
		return "channel/add";
	}
	
	
	
	
	@RequestMapping("/channel/add.do")//新增
	public String insert(TChannel channel,ModelMap map,HttpSession session){
		
		try {
			//获得session中的对象 作为创建人
			TUser cuser=(TUser) session.getAttribute("userBean");
			channel.setCreator(cuser.getId());
			
			cs.insert(channel);//新增
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//执行方法 传参
			return this.toadd(map);
		}
	}
	@RequestMapping("/channel/chkchannel.do")//检测栏目名
	@ResponseBody
	public String chkchannel(String cname){
		QueryChannel query = new QueryChannel();
		query.setCname(cname);
		List<TChannel> list = cs.queryByCon(query);
		if (list!=null&&list.size()!=0) {
			return "false";//存在
		}
		return "true";
	}
	
	
	@RequestMapping("/channel/delete.do")//删除
	public String delete(int id,ModelMap map){
		//删除一条
		try {
			cs.deleteById(id);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//跳方法  传参
			return this.queryByCon(new QueryChannel(), null, map);
		}
		
	}
	@RequestMapping("/channel/deletes.do")//批量删除
	public String deletes(int[] ids,ModelMap map){
		//批量删除
		try {
			cs.deleteByIds(ids);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//跳方法  传参
			return this.queryByCon(new QueryChannel(), null, map);
		}
		
	}
	
	
	@RequestMapping("/channel/get.do")//获得要修改的信息
	public String get(int id,ModelMap map){
		TChannel channel=cs.queryById(id);//通过id获得
		map.addAttribute("channel", channel);//把要修改的用户放到作用域
		QueryChannel c=new QueryChannel();
		c.setIsleaf(-1);//不是叶子的可以作为上级id
		//获得所有的上级栏目
		List<TChannel> channels = cs.queryByCon(c);
		
		if (channel.getChild()!=null) {
			//遍历要改的栏目的子栏目
			for (TChannel c2 : channel.getChild()) {
				for (TChannel c1 : channels) {
					if (c2.getId()==c1.getId()) {//如果做为上级栏目的栏目是 子栏目 则移除
						channels.remove(c1);
						break;
					}
				}	
			}
		}
		
		
		map.addAttribute("channels", channels);
		return "channel/update";
		
	}
	@RequestMapping("/channel/update.do")//修改
	public String update(TChannel channel,HttpSession session,ModelMap map){
		//获得sessin的信息
		TUser cuser=(TUser) session.getAttribute("userBean");
		channel.setUpdator(cuser.getId());
		try {
			cs.update(channel);
			//跳转到指定url 不需要传参
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			map.addAttribute("msg", e.getErrMsg());
			//发生异常重新 调用get()方法重新 修改
			return get(channel.getId(), map);
		}
		
		
	}
	
}
