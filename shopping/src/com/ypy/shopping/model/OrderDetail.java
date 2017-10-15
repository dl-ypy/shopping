package com.ypy.shopping.model;
/**
 * 订单详情
 * @author ypy
 *
 */
public class OrderDetail {
	private int detailid;
	private String orderid; 
	private int mcid;    
	private int buynum;
	
	private Order order;  //表示此详情的所属订单
	
	public OrderDetail(int detailid, String orderid, int mcid, int buynum) {
		super();
		this.detailid = detailid;
		this.orderid = orderid;
		this.mcid = mcid;
		this.buynum = buynum;
	}
	public OrderDetail() {
		super();
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getMcid() {
		return mcid;
	}
	public void setMcid(int mcid) {
		this.mcid = mcid;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}  

}
