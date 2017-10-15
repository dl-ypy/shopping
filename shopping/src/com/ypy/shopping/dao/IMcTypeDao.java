package com.ypy.shopping.dao;

import java.util.List;

import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;

public interface IMcTypeDao {
	/**
	 * �����Ʒ
	 * @param mcType
	 * @return -1��ʾʧ��
	 */
	int addMcType(McType mcType);
	
	/**
	 * ɾ����Ʒ
	 * @param id
	 * @return -1��ʾʧ��
	 */
	int delete(int id);
	
	/**
	 * �޸���Ʒ
	 * @param mcType
	 * @return -1��ʾʧ��
	 */
	int update(McType mcType);
	
	/**
	 * ��ѯ������Ʒ��Ϣ
	 * @param mcType
	 * @return null��ʾδ�鵽��Ϣ
	 */
	McType queryForSingle(McType mcType);
	
	/**
	 * ��������ѯ������Ʒ��Ϣ
	 * @param mcType
	 * @return null��ʾδ�鵽��Ϣ
	 */
	List<McType> queryAll(McType mcType);
	
	/**
	 * ��ѯ��Ʒ������
	 * @return
	 */
	List<McType> queryFather();
	
	/**
	 * ��ҳ��ѯ
	 * @param currentPage ��ǰҳ
	 * @param pageSize   ÿҳ��¼��
	 * @return
	 */
	<T> Page<T> queryPage(int currentPage, int pageSize);
	
}
