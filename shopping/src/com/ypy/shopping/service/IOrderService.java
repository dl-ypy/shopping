package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.Page;

public interface IOrderService {
	/**
	 * ��Ӷ���
	 * @param od
	 * @return -1��ʾʧ��
	 */
	int add(Order od);
	
	/**
	 * ɾ������
	 * @param orderid
	 * @return -1��ʾʧ��
	 */
	int delete(String orderid);
	
	/**
	 * �޸Ķ���
	 * @param od
	 * @return -1��ʾʧ��
	 */
	int update(Order od);
	
	/**
	 * ��ѯ����
	 * @param od
	 * @return null��ʾ�޼�¼
	 */
	List<Order> query(Order od);
	
	/**
	 * ��ѯ����
	 * @param orderid
	 * @return null��ʾ�޴˼�¼
	 */
	Order queryById(String orderid);
	
	/**
	 * ��ҳ��ѯ
	 * @param startDate �µ�ʱ��
	 * @param endDate �µ�ʱ��
	 * @param status ���״̬
	 * @param userid �û�id
	 * @param currentPage ��ǰҳ
	 * @param pageSize   ÿҳ��¼��
	 * @return
	 */
	<T> Page<T> queryPage(String startDate, String endDate, String status, int userid, int currentPage, int pageSize);
}
