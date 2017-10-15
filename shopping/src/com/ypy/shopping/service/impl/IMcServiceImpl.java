package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.impl.IMcDaoimpl;
import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IMcService;

public class IMcServiceImpl implements IMcService {
	IMcDaoimpl impl = new IMcDaoimpl();
	@Override
	public int add(Mc mc) {
		return impl.add(mc);
	}

	@Override
	public int delete(int id) {
		return impl.delete(id);
	}

	@Override
	public int update(Mc mc) {
		return impl.update(mc);
	}

	@Override
	public Mc queryForSingle(Mc mc) {
		return impl.queryForSingle(mc);
	}

	@Override
	public List<Mc> queryAll(Mc mc) {
		return impl.queryAll(mc);
	}

	@Override
	public <T> Page<T> queryPage(Mc mc, int currentPage, int pageSize) {
		return impl.queryPage(mc, currentPage, pageSize);
	}

	@Override
	public int deleteS(int id) {
		return impl.deleteS(id);
	}

}
