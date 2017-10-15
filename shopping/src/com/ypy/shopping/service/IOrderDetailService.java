package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;

public interface IOrderDetailService {
	/**
	 * ��Ӷ�������
	 * @param od
	 * @return -1��ʾʧ��
	 */
	int add(OrderDetail od);
	
	/**
	 * ɾ����������
	 * @param orderid
	 * @return -1��ʾʧ��
	 */
	int delete(int detailid);
	
	/**
	 * �޸Ķ�������
	 * @param od
	 * @return -1��ʾʧ��
	 */
	int update(OrderDetail odd);
	
	/**
	 * ��ѯ����
	 * @param od
	 * @return null��ʾ�޼�¼
	 */
	List<Order> query(OrderDetail od);
	
	/**
	 * ��ѯ����
	 * @param orderid
	 * @return null��ʾ�޴˼�¼
	 */
	Order queryById(int detailid);
	
	/**
	 * ��ҳ��ѯ
	 * @param orderid ������
	 * @param currentPage ��ǰҳ
	 * @param pageSize ÿҳ��¼��
	 * @return
	 */
	Page<OrderDetail> queryPage(String orderid, int currentPage, int pageSize);
}
