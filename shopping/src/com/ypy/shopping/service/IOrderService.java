package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.Page;

public interface IOrderService {
	/**
	 * 添加订单
	 * @param od
	 * @return -1表示失败
	 */
	int add(Order od);
	
	/**
	 * 删除订单
	 * @param orderid
	 * @return -1表示失败
	 */
	int delete(String orderid);
	
	/**
	 * 修改订单
	 * @param od
	 * @return -1表示失败
	 */
	int update(Order od);
	
	/**
	 * 查询多条
	 * @param od
	 * @return null表示无纪录
	 */
	List<Order> query(Order od);
	
	/**
	 * 查询单条
	 * @param orderid
	 * @return null表示无此记录
	 */
	Order queryById(String orderid);
	
	/**
	 * 分页查询
	 * @param startDate 下单时间
	 * @param endDate 下单时间
	 * @param status 审核状态
	 * @param userid 用户id
	 * @param currentPage 当前页
	 * @param pageSize   每页记录数
	 * @return
	 */
	<T> Page<T> queryPage(String startDate, String endDate, String status, int userid, int currentPage, int pageSize);
}
