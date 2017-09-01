package com.zhiyou100.video.service.front;

import java.util.List;

import com.zhiyou100.video.model.User;

public interface UserService {

	List<User> findUser(User u);

	void registUser(User u);

	void updateUser(User u);

	User findOneUser(Integer id);

	User findPassWord(String oldPassword);

	User getVerify(String email);

	User findMailUser(User u);

}
