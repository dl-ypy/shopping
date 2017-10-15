package com.ypy.shopping.service;

import java.util.List;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Page;

public interface IMcService {
	/**
	 * 添加商品
	 * @param mc
	 * @return -1表示失败
	 */
	int add(Mc mc);
	
	/**
	 * 删除商品
	 * @param id
	 * @return -1表示失败
	 */
	int delete(int id);
	
	/**
	 * 根据smalltypeid删除
	 * @param id
	 * @return
	 */
	int deleteS(int id);
	
	/**
	 * 修改商品
	 * @param mc
	 * @return -1表示失败
	 */
	int update(Mc mc);
	
	/**
	 * 查找单个商品
	 * @param mc
	 * @return null表示失败
	 */
	Mc queryForSingle(Mc mc);
	
	/**
	 * 按条件查找多个商品
	 * @param mc
	 * @return null表示失败
	 */
	List<Mc> queryAll(Mc mc);
	
	/**
	 * 分页查询
	 * @param mc 商品类
	 * @param currentPage 当前页
	 * @param pageSize   每页记录数
	 * @return
	 */
	<T> Page<T> queryPage(Mc mc, int currentPage, int pageSize);
}
