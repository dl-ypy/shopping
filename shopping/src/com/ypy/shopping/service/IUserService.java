package com.ypy.shopping.service;

import java.util.List;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;

public interface IUserService {
	int addUser(User user);
	int updateUser(User user);
	int deleteUser(User user);
	User queryForSingle(String username);
	User queryForSingle(String username, String password);
	User queryForSingle(int userid);
	List<User> queryAll(User user);
	Page<User> queryPage(User user, int currentPage, int pageSize);
}
