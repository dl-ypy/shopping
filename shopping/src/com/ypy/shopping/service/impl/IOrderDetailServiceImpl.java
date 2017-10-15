package com.ypy.shopping.service.impl;

import java.util.List;

import com.ypy.shopping.dao.IOrderDetailDao;
import com.ypy.shopping.dao.impl.IOrderDetailDaoImpl;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IOrderDetailService;

public class IOrderDetailServiceImpl implements IOrderDetailService {
	IOrderDetailDao dao = new IOrderDetailDaoImpl();
	@Override
	public int add(OrderDetail od) {
		return dao.add(od);
	}

	@Override
	public int delete(int detailid) {
		return dao.delete(detailid);
	}

	@Override
	public int update(OrderDetail odd) {
		return dao.update(odd);
	}

	@Override
	public List<Order> query(OrderDetail od) {
		return dao.query(od);
	}

	@Override
	public Order queryById(int detailid) {
		return dao.queryById(detailid);
	}

	@Override
	public Page<OrderDetail> queryPage(String orderid, int currentPage, int pageSize) {
		return dao.queryPage(orderid, currentPage, pageSize);
	}

}
