package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.IOrderDao;
import com.ypy.shopping.dao.impl.IOrderDaoImpl;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IOrderService;

public class IOrderServiceImpl implements IOrderService {
	IOrderDao dao = new IOrderDaoImpl();
	@Override
	public int add(Order od) {
		// TODO Auto-generated method stub
		return dao.add(od);
	}

	@Override
	public int delete(String orderid) {
		// TODO Auto-generated method stub
		return dao.delete(orderid);
	}

	@Override
	public int update(Order od) {
		// TODO Auto-generated method stub
		return dao.update(od);
	}

	@Override
	public List<Order> query(Order od) {
		// TODO Auto-generated method stub
		return dao.query(od);
	}

	@Override
	public Order queryById(String orderid) {
		return dao.queryById(orderid);
	}

	@Override
	public <T> Page<T> queryPage(String startDate, String endDate, String status, int userid, int currentPage,
			int pageSize) {
		return dao.queryPage(startDate, endDate, status, userid, currentPage, pageSize);
	}

}
