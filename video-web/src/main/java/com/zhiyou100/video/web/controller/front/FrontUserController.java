package com.zhiyou100.video.web.controller.front;

import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou100.video.model.Result;
import com.zhiyou100.video.model.User;
import com.zhiyou100.video.service.front.UserService;
import com.zhiyou100.video.util.MailUtil;

@Controller
@RequestMapping("/front/user")
public class FrontUserController {
	
	@Autowired
	UserService us;
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	@ResponseBody
	public Result adminUser(User u,HttpSession session){
		Result res = new Result();
		List<User> list = us.findUser(u);
		if(list.size()!=0){
			session.setAttribute("_front_user", list.get(0));
			res.setSuccess(true);
		}else{
			res.setMessage("用户不存在");
		}
		return res;
	}
	
	@RequestMapping("/regist.do")
	@ResponseBody
	public Result regist(User u,Model md){
		System.out.println("注册");
		Result res = new Result();
		if(u!=null){
			us.registUser(u);
			res.setMessage("注册成功");
			res.setSuccess(true);
		}else{
			res.setMessage("注册失败");
			res.setSuccess(false);
		}
		return res;
	}
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String index(HttpSession session,Model md){
		User u = (User) session.getAttribute("_front_user");
		md.addAttribute("user", u);
		return "/front/user/index";
	}
	@RequestMapping(value="/profile.do",method=RequestMethod.GET)
	public String profile(HttpSession session,Model md){
		User u = (User) session.getAttribute("_front_user");
		md.addAttribute("user", u);
		return "/front/user/profile";
	}
	@RequestMapping(value="/profile.do",method=RequestMethod.POST)
	public String profile(Model md,User u,HttpSession session){
		us.updateUser(u);
		User user = us.findOneUser(u.getId());
		session.setAttribute("_front_user",user);
		return "redirect:/front/user/index.do";
	}
	@RequestMapping(value="/avatar.do",method=RequestMethod.GET)
	public String avatar(HttpSession session,Model md){
		User u = (User) session.getAttribute("_front_user");
		md.addAttribute("user", u);
		return "/front/user/avatar";
	}
	@RequestMapping(value="/avatar.do",method=RequestMethod.POST)
	public String avatar(User u,MultipartFile image_file,HttpSession session,Model md) throws Exception{
		String str = UUID.randomUUID().toString().replaceAll("-", "");
		String extendName = FilenameUtils.getExtension(image_file.getOriginalFilename());
		String fileName = str+"."+extendName;
		String path = "E:\\upload";
		image_file.transferTo(new File(path+"\\"+fileName));
		u.setHeadUrl(fileName);
		us.updateUser(u);
		User user = us.findOneUser(u.getId());
		session.setAttribute("_front_user",user);
		return "redirect:/front/user/index.do";
	}
	@RequestMapping(value="/password.do",method=RequestMethod.GET)
	public String password(HttpSession session,Model md){
		User u = (User) session.getAttribute("_front_user");
		md.addAttribute("user", u);
		return "/front/user/password";
	}
	@RequestMapping(value="/password.do",method=RequestMethod.POST)
	@ResponseBody
	public Result password(String oldPassword,Integer id,String newPassword,HttpSession session,Model md){
		Result res = new Result();
		User user = us.findOneUser(id);
		oldPassword = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
		oldPassword = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
		if(user.getPassword().equals(oldPassword)){
			if(user!=null){
				res.setSuccess(true);
				user.setPassword(newPassword);
				us.updateUser(user);
				session.removeAttribute("_front_user");;
			}
		}else{
			res.setSuccess(false);
		}
		return res;
	}
	@RequestMapping(value="/forgetpwd.do",method=RequestMethod.GET)
	public String forgetpwd(){
		return "/front/user/forget_pwd";
	}
	@RequestMapping(value="/forgetpwd.do",method=RequestMethod.POST)
	public String forgetpwd(User u,Model md){
		String str = null;
		User user = us.findMailUser(u);
		if(u.getCaptcha().equals(user.getCaptcha())){
			md.addAttribute("user", user);
			str = "/front/user/reset_pwd" ;
		}else{
			md.addAttribute("user", u);
			md.addAttribute("mesg", "输入的验证码不正确");
			str = "/front/user/forget_pwd" ;
		}
		return str;
	}
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/front/index.action";
	}
	@RequestMapping("/sendemail.do")
	@ResponseBody
	public Result sendemail(String email,Model md){
		Result re = new Result();
		User u = us.getVerify(email);
		if(u!=null){
			re.setSuccess(true);
		}else{
			re.setSuccess(false);
			re.setMessage("用户不存在");
		}
		return re;
	}
	@RequestMapping(value="/resetpwd.do",method=RequestMethod.POST)
	public String resetpwd(User u,HttpSession session){
		if(u!=null){
			us.updateUser(u);
			session.removeAttribute("_front_user");;
		}
		return "redirect:/front/index.action";
	}
	@RequestMapping(value="/oldPassword.do",method=RequestMethod.GET)
	@ResponseBody
	public String password(String oldPassword,Integer userId){
		String str = null;
		User user = us.findOneUser(userId);
		oldPassword = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
		oldPassword = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
		if(user.getPassword().equals(oldPassword)){
			str = "success";
		}else{
		}
		return str;
	}

}
