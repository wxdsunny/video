package com.zhiyou100.video.web.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.video.mapper.SubjectMapper;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.service.SpeakerService;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.service.front.FrontCourseService;

@Controller
@RequestMapping("front/video")
public class FrontVideoController {
	
	@Autowired
	VideoService vs;
	@Autowired
	CourseService cs;
	@Autowired
	SpeakerService ss;
	@Autowired
	SubjectMapper sm;
	@Autowired
	FrontCourseService fcs;
	
	@RequestMapping("/index.do")
	public String index(Integer videoId,Integer subjectId,Model md){
		Subject subject = sm.selectByPrimaryKey(subjectId);
		md.addAttribute("subject", subject);
		md.addAttribute("subjectId", subjectId);
		md.addAttribute("videoId", videoId);
		return "front/video/index";
	}
	@RequestMapping("/videoData.do")
	public String videoData(Integer videoId,Model md,Integer subjectId){
		Video video = vs.findOneVideo(videoId);
		Course course = cs.findOneCourse(video.getCourseId());
		Speaker speaker = ss.findOneSpeaker(video.getSpeakerId());
		List<Video> list = vs.findVideoByCourse(course.getId());
		md.addAttribute("subjectId", subjectId);
		md.addAttribute("video", video);
		md.addAttribute("videoList", list);
		md.addAttribute("course", course);
		md.addAttribute("speaker", speaker);
		return "front/video/content";
	}
	@RequestMapping("/state.do")
	public void state(Integer videoId){
		Video video = vs.findOneVideo(videoId);
		int vi = video.getVideoPlayTimes() + 1;
		video.setVideoPlayTimes(vi);
		vs.updateVideo(video);
	}

}
