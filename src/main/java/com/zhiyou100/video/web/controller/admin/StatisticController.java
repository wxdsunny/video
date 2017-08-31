package com.zhiyou100.video.web.controller;

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
@RequestMapping("/statistic")
public class StatisticController {
	
	@Autowired
	VideoMapper vm;
	
	@RequestMapping("/statisticList.action")
	public  String statisticList(){
		return "statistic/statisticList";
	}
	@RequestMapping("/statistic.action")
	@ResponseBody
	public  String statistic(){
		List<Video> list = vm.statisticavg();
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
