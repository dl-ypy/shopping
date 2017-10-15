package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Page;

public interface IMcService {
	/**
	 * �����Ʒ
	 * @param mc
	 * @return -1��ʾʧ��
	 */
	int add(Mc mc);
	
	/**
	 * ɾ����Ʒ
	 * @param id
	 * @return -1��ʾʧ��
	 */
	int delete(int id);
	
	/**
	 * ����smalltypeidɾ��
	 * @param id
	 * @return
	 */
	int deleteS(int id);
	
	/**
	 * �޸���Ʒ
	 * @param mc
	 * @return -1��ʾʧ��
	 */
	int update(Mc mc);
	
	/**
	 * ���ҵ�����Ʒ
	 * @param mc
	 * @return null��ʾʧ��
	 */
	Mc queryForSingle(Mc mc);
	
	/**
	 * ���������Ҷ����Ʒ
	 * @param mc
	 * @return null��ʾʧ��
	 */
	List<Mc> queryAll(Mc mc);
	
	/**
	 * ��ҳ��ѯ
	 * @param mc ��Ʒ��
	 * @param currentPage ��ǰҳ
	 * @param pageSize   ÿҳ��¼��
	 * @return
	 */
	<T> Page<T> queryPage(Mc mc, int currentPage, int pageSize);
}
