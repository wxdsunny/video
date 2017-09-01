package com.zhiyou100.video.service.impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.video.mapper.SpeakerMapper;
import com.zhiyou100.video.mapper.VideoMapper;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.service.front.FrontCourseService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*")
public class SpeakerServiceImplTest {

	@Autowired
	SpeakerMapper sm;
	@Autowired
	VideoMapper vm;
	@Autowired
	VideoService vs;
	@Autowired
	FrontCourseService fcs;
	
	@Test
	public void test() {
		List<Course> list = fcs.findCourseList(10);
		System.out.println(list);
	}

}
