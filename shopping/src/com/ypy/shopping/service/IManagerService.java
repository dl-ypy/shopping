package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Manager;
import com.ypy.shopping.model.Page;

public interface IManagerService {
	int addManager(Manager manager);
	int updateManager(Manager manager);
	int deleteManager(Manager manager);
	Manager queryForSingle(String managername ,String password);
	Manager queryForSingle(int managerid);
	Manager queryForSingle(String musername);
	List<Manager> queryAll(Manager manager);
	Page<Manager> queryPage(Manager manager, int currentPage, int pageSize);
}
