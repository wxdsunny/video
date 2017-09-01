package com.zhiyou100.video.web.controller.admin;

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
	
	@RequestMapping("/admin/login.action")
	public String login(String username,String password,HttpSession session,Model md){
		String str = as.findAdmin(username,password);
		if(str.equals("succeed")){
			session.setAttribute("user", username);
			return "redirect:/admin/video/videoList.action";
		}else{
			String st = "用户名或密码不正确";
			md.addAttribute("st", st);
			return "forward:/index.jsp";
		}
	}
	
	
	@RequestMapping("/admin/logout.action")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "/index.jsp";
	}

}
