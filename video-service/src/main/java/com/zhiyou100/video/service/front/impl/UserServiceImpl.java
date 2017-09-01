package com.zhiyou100.video.service.front.impl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.mapper.UserMapper;
import com.zhiyou100.video.model.Result;
import com.zhiyou100.video.model.User;
import com.zhiyou100.video.model.UserExample;
import com.zhiyou100.video.service.front.UserService;
import com.zhiyou100.video.util.MailUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper um;
	
	@Override
	public List<User> findUser(User u) {
		UserExample example = new UserExample();
		example.createCriteria().andEmailEqualTo(u.getEmail()).andPasswordEqualTo(u.getPassword());
		List<User> list = um.selectByExample(example);
		return list;
	}

	@Override
	public void registUser(User u) {
		um.insertSelective(u);
	}

	@Override
	public void updateUser(User u) {
		um.updateByPrimaryKeySelective(u);
	}

	@Override
	public User findOneUser(Integer id) {
		User user = um.selectByPrimaryKey(id);
		return user;
	}

	@Override
	public User findPassWord(String oldPassword) {
		UserExample example = new UserExample();
		example.createCriteria().andPasswordEqualTo(oldPassword);
		List<User> list = um.selectByExample(example);
		return null;
	}

	@Override
	public User getVerify(String email) {
		MailUtil mailUtil = new MailUtil();
		Result re = new Result();
		Random ran = new Random();
		int random = ran.nextInt(99999-10000+1)+10000;
		String str = "" + random;
		UserExample example = new UserExample();
		example.createCriteria().andEmailEqualTo(email);
		List<User> list = um.selectByExample(example);
		list.get(0).setCaptcha(str);
		um.updateByPrimaryKeySelective(list.get(0));
		try {
			mailUtil.send(email, "验证码", str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list.get(0);
	}

	@Override
	public User findMailUser(User u) {
		UserExample example = new UserExample();
		example.createCriteria().andEmailEqualTo(u.getEmail());
		List<User> list = um.selectByExample(example );
		return list.get(0);
	}

	
}
