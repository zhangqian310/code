package com.zs.pms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//控制器     登录页和主页
public class FrameController {
	@RequestMapping("/tologin.do")//url去登录页
	public String tologin(){
		return "login";
	}
	@RequestMapping("/totop.do")//url去top
	public String totop(){
		return "top";
	}
	@RequestMapping("/toleft.do")//url去left
	public String toleft(){
		return "left";
	}
	@RequestMapping("/toright.do")//url去right
	public String toright(){
		return "right";
	}
}
