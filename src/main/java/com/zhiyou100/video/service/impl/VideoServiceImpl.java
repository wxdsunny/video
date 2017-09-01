package com.zhiyou100.video.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.mapper.CourseMapper;
import com.zhiyou100.video.mapper.SpeakerMapper;
import com.zhiyou100.video.mapper.VideoMapper;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.model.VideoExample;
import com.zhiyou100.video.service.VideoService;
import com.zhiyou100.video.util.Page;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	VideoMapper vm;
	@Autowired
	SpeakerMapper sm;
	@Autowired
	CourseMapper cm;

	@Override
	public List<Video> findAllVideo() {
		List<Video> list = vm.selectByExample(null);
		return list;
	}

	@Override
	public List<Speaker> findSpeaker() {
		List<Speaker> list = sm.selectByExample(null);
		return list;
	}

	@Override
	public List<Course> findCourse() {
		List<Course> list = cm.selectByExample(null);
		return list;
	}

	@Override
	public Page<Video> findVideoByCondition(String titleKey, Integer speakerKey, Integer courseKey, Integer currentPage) {
		Page<Video> page = new Page<>();
		page.setPage(currentPage);
		page.setSize(10);
		page.setTotal(vm.videoCount(titleKey,speakerKey,courseKey));
		page.setRows(vm.videoByCondition(titleKey,speakerKey,courseKey,(currentPage-1)*10));
		return page;
	}

	@Override
	public Video findOneVideo(Integer id) {
		Video video = vm.selectByPrimaryKey(id);
		return video;
	}

	@Override
	public void addVideo(Video v) {
		vm.insertSelective(v);
	}

	@Override
	public void deleteVideo(Integer id) {
		vm.deleteByPrimaryKey(id);
	}

	@Override
	public void updateVideo(Video v) {
		vm.updateByPrimaryKeySelective(v);
	}

	@Override
	public void deleteVideoByArray(Integer[] arr) {
		VideoExample example = new VideoExample();
		List<Integer> list = new ArrayList<Integer>();
		Collections.addAll(list, arr);
		example.createCriteria().andIdIn(list);
		vm.deleteByExample(example);
	}

	@Override
	public List<Video> findVideoByCourse(Integer id) {
		VideoExample example = new VideoExample();
		example.createCriteria().andCourseIdEqualTo(id);
		List<Video> list = vm.selectByExample(example );
		return list;
	}

}
