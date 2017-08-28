package com.zhiyou100.video.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.video.mapper.SpeakerMapper;
import com.zhiyou100.video.mapper.VideoMapper;
import com.zhiyou100.video.service.VideoService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*")
public class SpeakerServiceImplTest {

	@Autowired
	SpeakerMapper sm;
	@Autowired
	VideoMapper vm;
	@Autowired
	VideoService vs;
	
	@Test
	public void test() {
		System.out.println(vs.findVideoByCondition("", 0, 0, 0));
	}

}
