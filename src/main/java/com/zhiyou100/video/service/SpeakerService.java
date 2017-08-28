package com.zhiyou100.video.service;

import java.util.List;

import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.util.Page;

public interface SpeakerService {

	List<Speaker> findAllSpeaker();

	Page<Speaker> findSpeaker(String speakerKey, String speakerSearch, Integer currentPage);

	Speaker findOneSpeaker(Integer id);

	void addSpeaker(Speaker speaker);

	void deleteSpeaker(Integer id);

	void updateSpeaker(Speaker speaker);

}
