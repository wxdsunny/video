package com.zhiyou100.video.service;

import java.util.List;

import com.zhiyou100.video.model.Course;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.model.Video;
import com.zhiyou100.video.util.Page;

public interface VideoService {

	List<Video> findAllVideo();

	List<Speaker> findSpeaker();

	List<Course> findCourse();

	Page<Video> findVideoByCondition(String titleKey, Integer speakerKey, Integer courseKey, Integer currentPage);

	Video findOneVideo(Integer id);

	void addVideo(Video v);

	void deleteVideo(Integer id);

	void updateVideo(Video v);

	void deleteVideoByArray(Integer[] arr);

}
