package com.zhiyou100.video.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.util.Page;

@Controller
@RequestMapping("/video")
public class VideoController {

	@Autowired
	VideoService vs;

	@RequestMapping("/videoList.action")
	public String videoList(Model md, @RequestParam(required = true, defaultValue = "",value = "titleKey") String titleKey,
			@RequestParam(required = true, defaultValue = "0",value = "speakerKey") Integer speakerKey,
			@RequestParam(required = true, defaultValue = "0",value = "courseKey") Integer courseKey,
			@RequestParam(required = true, defaultValue = "1", value = "page") Integer currentPage) {
		Page<Video> page = vs.findVideoByCondition(titleKey, speakerKey, courseKey, currentPage);
		List<Speaker> speaker = vs.findSpeaker();
		List<Course> course = vs.findCourse();
		md.addAttribute("titleKey", titleKey);
		md.addAttribute("speakerKey", speakerKey);
		md.addAttribute("courseKey", courseKey);
		md.addAttribute("speaker", speaker);
		md.addAttribute("course", course);
		md.addAttribute("page", page);
		return "/video/videoList";

	}
	@RequestMapping(value="/addvideo.action",method=RequestMethod.GET)
	public String addVideo(Model md){
		List<Speaker> speaker = vs.findSpeaker();
		List<Course> course = vs.findCourse();
		md.addAttribute("speaker", speaker);
		md.addAttribute("course", course);
		return "/video/videoAdd";
	}
	@RequestMapping(value="/addvideo.action",method=RequestMethod.POST)
	public String addVideo(Model md,Video v){
		vs.addVideo(v);
		return "redirect:/video/videoList.action";
	}
	@RequestMapping("/deletevideo.action")
	public String deleteVideo(Integer id){
		vs.deleteVideo(id);
		return "redirect:/video/videoList.action";
	}
	@RequestMapping(value="/updatevideo.action",method=RequestMethod.GET)
	public String updateVideo(Integer id,Model md){
		Video video = vs.findOneVideo(id);
		md.addAttribute("video", video);
		List<Speaker> speaker = vs.findSpeaker();
		List<Course> course = vs.findCourse();
		md.addAttribute("speaker", speaker);
		md.addAttribute("course", course);
		return "/video/updateVideo";
	}
	@RequestMapping(value="/updatevideo.action",method=RequestMethod.POST)
	public String updateVideo(Video v){
		vs.updateVideo(v);
		return "redirect:/video/videoList.action";
	}
	@RequestMapping("/delteteVideoByNumber.action")
	public String deleteVideo(Integer[]arr){
		vs.deleteVideoByArray(arr);
		return "redirect:/video/videoList.action";
	}

}
