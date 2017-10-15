package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.impl.IMcTypeDaoImpl;
import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IMcTypeService;

public class IMcTypeServiceImpl implements IMcTypeService {
	IMcTypeDaoImpl impl = new IMcTypeDaoImpl();
	@Override
	public int addMcType(McType mcType) {
		return impl.addMcType(mcType);
	}

	@Override
	public int delete(int id) {
		return impl.delete(id);
	}

	@Override
	public int update(McType mcType) {
		return impl.update(mcType);
	}

	@Override
	public McType queryForSingle(McType mcType) {
		return impl.queryForSingle(mcType);
	}

	@Override
	public List<McType> queryAll(McType mcType) {
		return impl.queryAll(mcType);
	}

	@Override
	public List<McType> queryFather() {
		return impl.queryFather();
	}

	@Override
	public <T> Page<T> queryPage(int currentPage, int pageSize) {
		return impl.queryPage(currentPage, pageSize);
	}
}
