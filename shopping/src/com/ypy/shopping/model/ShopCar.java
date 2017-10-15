package com.ypy.shopping.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * ���ﳵ
 * ע�⣺EL���ʽ����.�õ����ԣ�ʵ����ͨ��ƥ��get�����õ���
 * @author ypy
 *
 */
public class ShopCar {
	//��Ʒ��Ϣ
	private List<Mc> mcList = new ArrayList<Mc>();
	//���ﳵ�е���Ʒ����
	private int totalCount;
	//��Ʒ�������
	private int totalType;
	//�ܼ۸�
	private double totalPrice;
	
	/**
	 * ����ģʽ�õ�session
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
	 * �����Ʒ
	 * @param mc
	 */
	public void add(Mc mc) {
		boolean flag = true;   //��ʾ��һ�������Ʒ
		for (Mc m : mcList) {
			if (m.getMcid() == mc.getMcid()) {
				m.setCount(m.getCount()+1);  //��ʾ����Ʒ�Ѿ���ӹ���������1
				flag = false;
				break;
			}
		}
		
		if (flag) { //��ʾ��һ�����
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
	 * �õ�����Ʒ��
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
	 * �õ���Ʒ������
	 * @return
	 */
	public int getTotalType() {
		return mcList.size();
	}
	
	/**
	 * �õ���Ʒ�ܼ۸�
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
	 * ɾ����Ʒ
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
	 * �޸���Ʒ����
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
	 * ��չ��ﳵ
	 */
	public void clear() {
		mcList.clear();
	}
}
