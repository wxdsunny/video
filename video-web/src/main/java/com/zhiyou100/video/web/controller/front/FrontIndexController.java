package com.zhiyou100.video.web.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/front")
public class FrontIndexController {
	
	
	@RequestMapping("/index.action")
	public String indext(){
		return "/front/index";
	}
	@RequestMapping(value="/login.action")
	public String login(){
		return "/front/index";
	}

}
