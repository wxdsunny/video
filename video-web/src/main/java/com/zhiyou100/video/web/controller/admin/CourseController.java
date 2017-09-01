package com.zhiyou100.video.web.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.util.Page;

@Controller
@RequestMapping("/admin/course")
public class CourseController {
	
	@Autowired
	CourseService cs;
	
	@RequestMapping("/courseList.action")
	public String courseList(Model md,@RequestParam(required=true,defaultValue="1",value="page")Integer currentpage){
		Page<Course> page = cs.findAllCourse(currentpage);
		md.addAttribute("page", page);
		return "/admin/course/courseList";
		
	}
	@RequestMapping(value="/addCourse.action",method=RequestMethod.GET)
	public String addCourse(Model md){
		List<Subject> subject = cs.findSubject();
		md.addAttribute("subject", subject);
		return "/admin/course/addCourse";
	}
	@RequestMapping(value="/addCourse.action",method=RequestMethod.POST)
	public String addCourse(Course course){
		cs.addCourse(course);
		return "redirect:/admin/course/courseList.action";
	}
	@RequestMapping(value="/updateCourse.action",method=RequestMethod.GET)
	public String updateCourse(Model md,Integer id){
		List<Subject> subject = cs.findSubject();
		md.addAttribute("subject", subject);
		Course course = cs.findOneCourse(id);
		md.addAttribute("course", course);
		return "/admin/course/updateCourse";
	}
	@RequestMapping(value="/updateCourse.action",method=RequestMethod.POST)
	public String updateCourse(Course course){
		cs.updateCourse(course);
		return "redirect:/admin/course/courseList.action";
	}
	@RequestMapping(value="/delleteCourse.action")
	public String deleteCourse(Integer id){
		cs.deleteCourse(id);
		return "redirect:/admin/course/courseList.action";
	}

}
