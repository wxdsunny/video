package com.zhiyou100.video.service;

import java.util.List;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Subject;
import com.zhiyou100.video.util.Page;

public interface CourseService {

	Page<Course> findAllCourse(Integer currentpage);

	List<Subject> findSubject();

	void addCourse(Course course);

	Course findOneCourse(Integer id);

	void updateCourse(Course course);

	void deleteCourse(Integer id);

}
