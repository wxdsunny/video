package com.zhiyou100.video.web.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou100.video.mapper.VideoMapper;
import com.zhiyou100.video.model.Video;

@Controller
@RequestMapping("/admin/statistic")
public class StatisticController {
	
	@Autowired
	VideoMapper vm;
	
	@RequestMapping("/statisticList.action")
	public  String statisticList(){
		return "/admin/statistic/statisticList";
	}
	@RequestMapping("/statistic.action")
	@ResponseBody
	public  String statistic(){
		List<Video> list = new ArrayList<>();
		List<Video> videos = vm.statisticavg();
		for (Video video : videos) {
			if(video.getCourseName()!=null&&video.getAverage()!=0.0){
				list.add(video);
			}else{
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
	}

}
