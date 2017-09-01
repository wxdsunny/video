package com.zhiyou100.video.service.front;

import java.util.List;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Subject;

public interface FrontCourseService {

	Subject findOneSubjict(Integer subjectId);

	List<Course> findCourseList(Integer subjectId);

}
