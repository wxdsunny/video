package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.zhiyou100.video.mapper.AdminMapper;
import com.zhiyou100.video.model.Admin;
import com.zhiyou100.video.model.AdminExample;
import com.zhiyou100.video.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper am;
	
	@Override
	public String findAdmin(String username, String password) {
		String key = DigestUtils.md5DigestAsHex(password.getBytes());
		String str = "fail";
		AdminExample example = new AdminExample();
		example.createCriteria().andLoginNameEqualTo(username).andLoginPwdEqualTo(key);
		List<Admin> list = am.selectByExample(example);
		if(list.size()!=0){
			str = "succeed";
		}
		return str;
	}

}
