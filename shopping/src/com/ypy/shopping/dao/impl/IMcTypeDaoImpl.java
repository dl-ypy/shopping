package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ypy.shopping.dao.IMcTypeDao;
import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.util.DB;

public class IMcTypeDaoImpl implements IMcTypeDao {
	String sql = "";
	@Override
	public int addMcType(McType mcType) {
		sql = "insert into t_mctype values(seq_t_mctype.nextval,?,?)";
		return DB.DML(sql, mcType.getTypename(), mcType.getFatherid());
	}

	@Override
	public int delete(int id) {
		sql = "delete from t_mctype where typeid=? or fatherid=?"; //删除大类的同时删除小类
		return DB.DML(sql, id, id);
	}

	@Override
	public int update(McType mcType) {
		sql = "update t_mctype set typename=?,fatherid=? where typeid=?";
		return DB.DML(sql, mcType.getTypename(), mcType.getFatherid(), mcType.getTypeid());
	}

	@Override
	public McType queryForSingle(McType mcType) {
		sql = "select * from t_mctype where typeid=?";
		List<McType> list = DB.selectAll(sql, McType.class, mcType.getTypeid());
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<McType> queryAll(McType mcType) {
		sql = "select * from t_mctype where 1=1";
		if (!"".equals(mcType.getTypename()) && mcType.getTypename()!=null) {
			sql += " and typename='"+mcType.getTypename()+"'";
		}
		if (mcType.getFatherid() != 0) {
			sql += " and fatherid='"+ mcType.getFatherid()+"'" ;
		}
		return DB.selectAll(sql, McType.class);
	}

	@Override
	public List<McType> queryFather() {
		sql = "select * from t_mctype where fatherid=?";
		return DB.selectAll(sql, McType.class, 0);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public <T> Page<T> queryPage(int currentPage, int pageSize) {
		StringBuffer countSql = new StringBuffer("select count(1) from t_mctype where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_mctype t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer(" order by fatherid");
		List list = new ArrayList<>();
		return (Page<T>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, McType.class, list);
	}

}
