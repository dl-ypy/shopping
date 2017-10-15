package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ypy.shopping.dao.IOrderDetailDao;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.util.DB;

public class IOrderDetailDaoImpl implements IOrderDetailDao {

	@Override
	public int add(OrderDetail od) {
		String sql = "insert into t_orderdetail values(seq_t_orderdetail.nextval,?,?,?)";
		return DB.DML(sql, od.getOrderid(), od.getMcid(), od.getBuynum());
	}

	@Override
	public int delete(int detailid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(OrderDetail odd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> query(OrderDetail od) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order queryById(int detailid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<OrderDetail> queryPage(String orderid, int currentPage, int pageSize) {
		List list = new ArrayList<>();
		StringBuffer countSql = new StringBuffer("select count(1) from t_orderdetail where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		if (!"".equals(orderid) && orderid!=null) {
			whereSql.append(" and orderid=?");
			list.add(orderid);
		}
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_orderdetail t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer("");
		return (Page<OrderDetail>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, OrderDetail.class, list);
	}

}
