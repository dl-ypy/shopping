package com.ypy.shopping.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * 购物车
 * 注意：EL表达式中用.得到属性，实际是通过匹配get方法得到。
 * @author ypy
 *
 */
public class ShopCar {
	//商品信息
	private List<Mc> mcList = new ArrayList<Mc>();
	//购物车中的商品总量
	private int totalCount;
	//商品类别总数
	private int totalType;
	//总价格
	private double totalPrice;
	
	/**
	 * 单例模式得到session
	 * @param session
	 * @return
	 */
	public static ShopCar getSession(HttpSession session) {
		ShopCar shopcar = (ShopCar) session.getAttribute("SHOPCAR");
		if (shopcar == null) {
			shopcar = new ShopCar();
			session.setAttribute("SHOPCAR", shopcar);
		}
		return shopcar;
	}
	
	/**
	 * 添加商品
	 * @param mc
	 */
	public void add(Mc mc) {
		boolean flag = true;   //表示第一次添加商品
		for (Mc m : mcList) {
			if (m.getMcid() == mc.getMcid()) {
				m.setCount(m.getCount()+1);  //表示此商品已经添加过，数量加1
				flag = false;
				break;
			}
		}
		
		if (flag) { //表示第一次添加
			mc.setCount(1);
			mcList.add(mc);
		}
	}
	
	public List<Mc> getMcList() {
		return mcList;
	}
	
	public void setMcList(List<Mc> mcList) {
		this.mcList = mcList;
	}
	
	/**
	 * 得到总商品数
	 * @return
	 */
	public int getTotalCount() {
		int totalcount = 0;
		for (Mc mc : mcList) {
			totalcount+=mc.getCount();
		}
		return totalcount;
	}
	
	/**
	 * 得到商品总类数
	 * @return
	 */
	public int getTotalType() {
		return mcList.size();
	}
	
	/**
	 * 得到商品总价格
	 * @return
	 */
	public double getTotalPrice() {
		double price = 0;
		for (Mc mc : mcList) {
			price += mc.getTotalPrice();
		}
		return price;
	}
	
	/**
	 * 删除商品
	 * @param id
	 */
	public void remove(int id) {
		for (int i=0; i<mcList.size(); i++) {
			if (mcList.get(i).getMcid() == id) {
				mcList.remove(mcList.get(i));
			}
		}
	}
	
	/**
	 * 修改商品数量
	 * @param md
	 */
	public void update(Mc md) {
		for (Mc mc : mcList) {
			if (mc.getMcid() == md.getMcid()) {
				mc.setCount(md.getCount());
			}
		}
	}
	
	/**
	 * 清空购物车
	 */
	public void clear() {
		mcList.clear();
	}
}
