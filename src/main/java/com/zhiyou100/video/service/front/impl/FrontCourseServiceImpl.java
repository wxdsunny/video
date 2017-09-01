package com.zhiyou100.video.service.front.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.mapper.CourseMapper;
import com.zhiyou100.video.mapper.SubjectMapper;
import com.zhiyou100.video.mapper.VideoMapper;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.CourseExample;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.model.VideoExample;
import com.zhiyou100.video.service.front.FrontCourseService;

@Service
public class FrontCourseServiceImpl implements FrontCourseService {

	@Autowired
	SubjectMapper sm;
	@Autowired
	CourseMapper cm;
	@Autowired
	VideoMapper vm;
	
	@Override
	public Subject findOneSubjict(Integer subjectId) {
		Subject subject = sm.selectByPrimaryKey(subjectId);
		return subject;
	}

	@Override
	public List<Course> findCourseList(Integer subjectId) {
		CourseExample example = new CourseExample();
		example.createCriteria().andSubjectIdEqualTo(subjectId);
		List<Course> cour = cm.selectByExample(example);
		List<Course> course = new ArrayList<>();
		for (Course course2 : cour) {
			VideoExample exa = new VideoExample();
			exa.createCriteria().andCourseIdEqualTo(course2.getId());
			List<Video> exam = vm.selectByExample(exa);
			course2.setVideoList(exam);
			course.add(course2);
		}
		return course;
	}
}
