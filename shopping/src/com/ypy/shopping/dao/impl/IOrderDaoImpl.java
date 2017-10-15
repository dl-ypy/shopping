package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ypy.shopping.dao.IOrderDao;
import com.ypy.shopping.dao.IOrderDetailDao;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.util.DB;

public class IOrderDaoImpl implements IOrderDao {

	@Override
	public int add(Order od) {
		//1.保存订单信息
		String orderid = new Date().getTime()+"";   //用系统当前时间作为id
		String sql="insert into t_orders (orderid, userid, quantity, alltype, totalprice, paytype, receivedtype,"
				+ " username, address, postcode, phoneno, email, orderdate, status,approveduser) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0,?)";
		int i=DB.DML(sql,orderid,od.getUserid(),od.getQuantity(),od.getAlltype(),od.getTotalprice(),
				od.getPaytype(),od.getReceivedtype(),od.getUsername(),od.getAddress(),od.getPostcode(),od.getPhoneno()
				,od.getEmail(),od.getApproveduser());

		//2.保存订单详情信息
		IOrderDetailDao dao = new IOrderDetailDaoImpl();
		for (OrderDetail detail : od.getList()) {
			detail.setOrderid(orderid);
			dao.add(detail);
		}
		return i;
	}

	@Override
	public int delete(String orderid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Order od) {
		List param=new ArrayList();
		StringBuffer sql=new StringBuffer("update t_orders set ");
		if(!("".equals(od.getAddress()))&&od.getAddress()!=null) {
			sql.append("address=?,");
			param.add(od.getAddress());			
		}
		if(!("".equals(od.getAlltype()))&&od.getAlltype()!=-1) {
			sql.append("alltype=?,");
			param.add(od.getAlltype());			
		}
		if(!("".equals(od.getApproveddate()))&&od.getApproveddate()!=null) {
			sql.append("approveddate=?,");
			param.add(od.getApproveddate());			
		}
		if(!("".equals(od.getApproveduser()))&&od.getApproveduser()!=null) {
			sql.append("approveduser=?,");
			param.add(od.getApproveduser());			
		}
		if(!("".equals(od.getEmail()))&&od.getEmail()!=null) {
			sql.append("email=?,");
			param.add(od.getEmail());			
		}
		if(!("".equals(od.getMsg()))&&od.getMsg()!=null) {
			sql.append("msg=?,");
			param.add(od.getMsg());			
		}
		if(!("".equals(od.getOrderdate()))&&od.getOrderdate()!=null) {
			sql.append("orderdate=?,");
			param.add(od.getOrderdate());			
		}
		if(!("".equals(od.getPaytype()))&&od.getPaytype()!=null) {
			sql.append("paytype=?,");
			param.add(od.getPaytype());			
		}
		if(!("".equals(od.getPhoneno()))&&od.getPhoneno()!=null) {
			sql.append("phoneno=?,");
			param.add(od.getPhoneno());			
		}
		if(!("".equals(od.getPostcode()))&&od.getPostcode()!=null) {
			sql.append("postcode=?,");
			param.add(od.getPostcode());			
		}
		if(!("".equals(od.getQuantity()))&&od.getQuantity()!=-1) {
			sql.append("quantity=?,");
			param.add(od.getQuantity());			
		}
		if(!("".equals(od.getReceivedtype()))&&od.getReceivedtype()!=null) {
			sql.append("receivedtype=?,");
			param.add(od.getReceivedtype());			
		}
		if(!("".equals(od.getStatus()))&&od.getStatus()!=null) {
			sql.append("status=?,");
			param.add(od.getStatus());			
		}
		if(!("".equals(od.getTotalprice()))&&od.getTotalprice()!=-1) {
			sql.append("totalprice=?,");
			param.add(od.getTotalprice());			
		}
		if(!("".equals(od.getUserid()))&&od.getUserid()!=-1) {
			sql.append("userid=?,");
			param.add(od.getUserid());			
		}
		if(!("".equals(od.getUsername()))&&od.getUsername()!=null) {
			sql.append("username=?,");
			param.add(od.getUsername());			
		}
		//判断最后一个是否是逗号
		if (',' == (sql.charAt(sql.length()-1))) {
			sql.replace(sql.length()-1, sql.length(), "");
		}
		sql.append(" where orderid=?");
		param.add(od.getOrderid());
		return DB.DML(sql.toString(), param.toArray());
	}

	@Override
	public List<Order> query(Order od) {
		StringBuffer sql = new StringBuffer("select * from t_orders where 1=1");
		if (!"".equals(od.getApproveduser()) && od.getApproveduser()!=null) {
			sql.append(" and approveduser='"+od.getApproveduser()+"'");
		}
		return DB.selectAll(sql.toString(), Order.class);
	}

	@Override
	public Order queryById(String orderid) {
		String sql = "select * from t_orders where orderid=?";
		List<Order> list = DB.selectAll(sql, Order.class, orderid);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public <T> Page<T> queryPage(String startDate, String endDate, String status, int userid, int currentPage, int pageSize) {
		List list = new ArrayList<>();
		StringBuffer countSql = new StringBuffer("select count(1) from t_orders where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		if (!"".equals(startDate) && startDate!=null) {
			whereSql.append(" and orderdate>=to_date(?,'yyyy-mm-dd hh24:mi:ss')");
			list.add(startDate);
		}
		if (!"".equals(endDate) && endDate!=null) {
			whereSql.append(" and orderdate<=to_date(?,'yyyy-mm-dd hh24:mi:ss')");
			list.add(endDate);
		}
		if (!"".equals(status) && status!=null && !"-1".equals(status)) {
			whereSql.append(" and status=?");
			list.add(status);
		}
		if (userid != -1) {
			whereSql.append(" and userid=?");
			list.add(userid);
		}
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_orders t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer("");
		return (Page<T>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, Order.class, list);
	}

}
