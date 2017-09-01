package com.zhiyou100.video.web.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.service.front.FrontCourseService;

@Controller
@RequestMapping("/front/course")
public class FrontCourseController {
	
    @Autowired
    CourseService cs;
    @Autowired
    VideoService vs;
    @Autowired
    FrontCourseService fcs;
	
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String findOneCourse(Integer subjectId,Model md){
		Subject subject = fcs.findOneSubjict(subjectId);
		List<Course> course = fcs.findCourseList(subjectId);
		md.addAttribute("subject", subject);
		md.addAttribute("subjectId", subjectId);
		md.addAttribute("courses", course);
		return "/front/course/index";
	}

}
