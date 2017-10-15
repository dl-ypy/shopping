package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;

public interface IOrderDetailService {
	/**
	 * 添加订单详情
	 * @param od
	 * @return -1表示失败
	 */
	int add(OrderDetail od);
	
	/**
	 * 删除订单详情
	 * @param orderid
	 * @return -1表示失败
	 */
	int delete(int detailid);
	
	/**
	 * 修改订单详情
	 * @param od
	 * @return -1表示失败
	 */
	int update(OrderDetail odd);
	
	/**
	 * 查询多条
	 * @param od
	 * @return null表示无纪录
	 */
	List<Order> query(OrderDetail od);
	
	/**
	 * 查询单条
	 * @param orderid
	 * @return null表示无此记录
	 */
	Order queryById(int detailid);
	
	/**
	 * 分页查询
	 * @param orderid 订单号
	 * @param currentPage 当前页
	 * @param pageSize 每页记录数
	 * @return
	 */
	Page<OrderDetail> queryPage(String orderid, int currentPage, int pageSize);
}
