package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.IManagerDao;
import com.ypy.shopping.dao.impl.IManagerDaoImpl;
import com.ypy.shopping.model.Manager;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IManagerService;

public class IManagerServiceIpml implements IManagerService {
	IManagerDao dao = new IManagerDaoImpl();
	@Override
	public Manager queryForSingle(String username, String password) {
		return dao.queryForSingle(username, password);
	}
	@Override
	public int addManager(Manager manager) {
		return dao.addManager(manager);
	}
	@Override
	public int updateManager(Manager manager) {
		return dao.updateManager(manager);
	}
	@Override
	public int deleteManager(Manager manager) {
		return dao.deleteManager(manager);
	}
	@Override
	public Manager queryForSingle(int managerid) {
		return dao.queryForSingle(managerid);
	}
	@Override
	public List<Manager> queryAll(Manager manager) {
		return dao.queryAll(manager);
	}
	@Override
	public Page<Manager> queryPage(Manager manager, int currentPage, int pageSize) {
		return dao.queryPage(manager, currentPage, pageSize);
	}
	@Override
	public Manager queryForSingle(String musername) {
		return dao.queryForSingle(musername);
	}
}
