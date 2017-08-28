package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.mapper.SpeakerMapper;
import com.zhiyou100.video.model.Speaker;
import com.zhiyou100.video.service.SpeakerService;
import com.zhiyou100.video.util.Page;

@Service
public class SpeakerServiceImpl implements SpeakerService {
	
	@Autowired
	SpeakerMapper sm;

	@Override
	public List<Speaker> findAllSpeaker() {
		List<Speaker> list = sm.selectByExample(null);
		return list;
	}

	@Override
	public Page<Speaker> findSpeaker(String speakerKey, String speakerSearch, Integer currentPage) {
		Page<Speaker> page = new Page<>();
		page.setPage(currentPage);
		page.setSize(10);
		page.setTotal(sm.selectCount(speakerKey,speakerSearch));
		page.setRows(sm.selectSpeaker(speakerKey,speakerSearch,(currentPage-1)*10));
		return page;
	}

	@Override
	public Speaker findOneSpeaker(Integer id) {
		Speaker speaker = sm.selectByPrimaryKey(id);
		return speaker;
	}

	@Override
	public void addSpeaker(Speaker speaker) {
		sm.insert(speaker);
	}

	@Override
	public void deleteSpeaker(Integer id) {
		sm.deleteByPrimaryKey(id);
	}

	@Override
	public void updateSpeaker(Speaker speaker) {
		sm.updateByPrimaryKey(speaker);
	}

}
