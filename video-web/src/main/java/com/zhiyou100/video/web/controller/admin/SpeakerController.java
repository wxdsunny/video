package com.zhiyou100.video.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.service.SpeakerService;
import com.zhiyou100.video.util.Page;

@Controller
@RequestMapping("/admin/speaker")
public class SpeakerController {

	@Autowired
	SpeakerService ss;

	@RequestMapping("/speakerList.action")
	public String speakerList(Model md, @RequestParam(required = true, defaultValue = "") String speakerKey,
			@RequestParam(required = true, defaultValue = "") String speakerSearch,
			@RequestParam(required = true, defaultValue = "1", value = "page") Integer currentPage) {
		Page<Speaker> page = ss.findSpeaker(speakerKey,speakerSearch,currentPage);
		md.addAttribute("speakerKey", speakerKey);
		md.addAttribute("speakerSearch", speakerSearch);
		md.addAttribute("page", page);
		return "/admin/speaker/speakerList";

	}
	@RequestMapping(value="/addSpeaker.action",method=RequestMethod.GET)
	public String addSpeaker(Model md) {
		return "/admin/speaker/addSpeaker";
		
	}
	@RequestMapping(value="/addSpeaker.action",method=RequestMethod.POST)
	public String addSpeaker(Model md,Speaker speaker) {
		ss.addSpeaker(speaker);
		return "redirect:/admin/speaker/speakerList.action";
		
	}
	@RequestMapping("/deleteSpeaker.action")
	@ResponseBody
	public String deleteSpeaker(Integer id) {
		ss.deleteSpeaker(id);
		String str = "ok";
		return str;
		
	}
	@RequestMapping(value="/updateSpeaker.action",method=RequestMethod.GET)
	public String updateSpeaker(Integer id,Model md) {
		Speaker speaker = ss.findOneSpeaker(id);
		md.addAttribute("speaker", speaker);
		return "/admin/speaker/updateSpeaker";
	}
	@RequestMapping(value="/updateSpeaker.action",method=RequestMethod.POST)
	public String updateSpeaker(Speaker speaker) {
		ss.updateSpeaker(speaker);
		return "redirect:/admin/speaker/speakerList.action";
	}

}
