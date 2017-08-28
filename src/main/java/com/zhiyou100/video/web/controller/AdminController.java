package com.zhiyou100.video.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou100.video.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService as;
	
	@RequestMapping("/login.action")
	public String login(String username,String password,HttpSession session,Model md){
		String str = as.findAdmin(username,password);
		if(str.equals("succeed")){
			session.setAttribute("user", username);
			return "forward:/admin.jsp";
		}else{
			String st = "用户名或密码不正确";
			md.addAttribute("st", st);
			return "forward:/index.jsp";
		}
	}
	
	
/*	@RequestMapping("/delteteVideoByNumber.action")
	public String deleteVideo(Integer[]arr){
		System.out.println(11);
		System.out.println(arr);
		return null;
	}*/

}
