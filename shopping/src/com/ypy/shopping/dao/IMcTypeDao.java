package com.ypy.shopping.dao;

import java.util.List;

import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;

public interface IMcTypeDao {
	/**
	 * 添加商品
	 * @param mcType
	 * @return -1表示失败
	 */
	int addMcType(McType mcType);
	
	/**
	 * 删除商品
	 * @param id
	 * @return -1表示失败
	 */
	int delete(int id);
	
	/**
	 * 修改商品
	 * @param mcType
	 * @return -1表示失败
	 */
	int update(McType mcType);
	
	/**
	 * 查询单个商品信息
	 * @param mcType
	 * @return null表示未查到信息
	 */
	McType queryForSingle(McType mcType);
	
	/**
	 * 按条件查询多条商品信息
	 * @param mcType
	 * @return null表示未查到信息
	 */
	List<McType> queryAll(McType mcType);
	
	/**
	 * 查询商品类别大类
	 * @return
	 */
	List<McType> queryFather();
	
	/**
	 * 分页查询
	 * @param currentPage 当前页
	 * @param pageSize   每页记录数
	 * @return
	 */
	<T> Page<T> queryPage(int currentPage, int pageSize);
	
}
