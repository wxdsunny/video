package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.mapper.CourseMapper;
import com.zhiyou100.video.mapper.SubjectMapper;
import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.util.Page;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper cm;
	@Autowired
	SubjectMapper sm;
	
	@Override
	public Page<Course> findAllCourse(Integer currentpage) {
		Page<Course> page = new Page<>();
		List<Course> course = cm.selectAllCourse((currentpage-1)*10);
		int count = cm.selectCount();
		page.setPage(currentpage);
		page.setTotal(count);
		page.setSize(10);
		page.setRows(course);
		return page;
	}

	@Override
	public List<Subject> findSubject() {
		List<Subject> list = sm.selectByExample(null);
		return list;
	}

	@Override
	public void addCourse(Course course) {
		cm.insert(course);
	}

	@Override
	public Course findOneCourse(Integer id) {
		Course course = cm.selectByPrimaryKey(id);
		return course;
	}

	@Override
	public void updateCourse(Course course) {
		cm.updateByPrimaryKeySelective(course);
	}

	@Override
	public void deleteCourse(Integer id) {
		cm.deleteByPrimaryKey(id);
	}

}
