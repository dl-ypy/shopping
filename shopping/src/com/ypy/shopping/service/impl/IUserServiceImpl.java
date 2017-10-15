package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.impl.IUserDaoImpl;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IUserService;

public class IUserServiceImpl implements IUserService {
	IUserDaoImpl impl = new IUserDaoImpl();
	
	@Override
	public int addUser(User user) {
		return impl.addUser(user);
	}

	@Override
	public int updateUser(User user) {
		return impl.updateUser(user);
	}

	@Override
	public int deleteUser(User user) {
		return impl.deleteUser(user);
	}

	@Override
	public User queryForSingle(String username, String password) {
		return impl.queryForSingle(username, password);
	}

	@Override
	public List<User> queryAll(User user) {
		return impl.queryAll(user);
	}

	@Override
	public Page<User> queryPage(User user, int currentPage, int pageSize) {
		return impl.queryPage(user, currentPage, pageSize);
	}

	@Override
	public User queryForSingle(int userid) {
		return impl.queryForSingle(userid);
	}

	@Override
	public User queryForSingle(String username) {
		return impl.queryForSingle(username);
	}

}
