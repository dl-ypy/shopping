package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ypy.shopping.dao.IManagerDao;
import com.ypy.shopping.model.Manager;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.util.DB;

public class IManagerDaoImpl implements IManagerDao {

	@Override
	public Manager queryForSingle(String username, String password) {
		String sql = "select * from t_manager where musername=? and mpassword=?";
		List<Manager> list = DB.selectAll(sql, Manager.class, username, password);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int addManager(Manager Manager) {
		String sql = "insert into t_manager values(seq_t_manager.nextval,?,?,?,?,?,?)";
		return DB.DML(sql, Manager.getMusername(),"123456",Manager.getMtruename(),Manager.getMsex(),1,Manager.getMdate());
	}

	@Override
	public int updateManager(Manager Manager) {
		List param=new ArrayList();
		StringBuffer sql=new StringBuffer("update t_manager set ");
		if(!"".equals(Manager.getMusername())&&Manager.getMusername()!=null) {
			sql.append("musername=?,");
			param.add(Manager.getMusername());			
		}
		if(!"".equals(Manager.getMpassword())&&Manager.getMpassword()!=null) {
			sql.append("mpassword=?,");
			param.add(Manager.getMpassword());			
		}
		if(!"".equals(Manager.getMtruename())&&Manager.getMtruename()!=null) {
			sql.append("mtruename=?,");
			param.add(Manager.getMtruename());			
		}
		if(!"".equals(Manager.getMsex())&&Manager.getMsex()!=null) {
			sql.append("msex=?,");
			param.add(Manager.getMsex());			
		}
		if(Manager.getMlevel() != 0) {
			sql.append("mlevel=?,");
			param.add(Manager.getMlevel());			
		}
		//判断最后一个是否是逗号
		if (',' == (sql.charAt(sql.length()-1))) {
			sql.replace(sql.length()-1, sql.length(), "");
		}
		sql.append(" where mid=?");
		param.add(Manager.getMid());
		return DB.DML(sql.toString(), param.toArray());
	}

	@Override
	public int deleteManager(Manager Manager) {
		String sql = "delete from t_manager where mid=?";
		return DB.DML(sql, Manager.getMid());
	}

	@Override
	public Manager queryForSingle(int Managerid) {
		String sql = "select * from t_manager where mid=?";
		List<Manager> list = DB.selectAll(sql, Manager.class, Managerid);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Manager> queryAll(Manager manager) {
		String sql = "select * from t_manager";
		return DB.selectAll(sql, Manager.class);
	}

	@Override
	public Page<Manager> queryPage(Manager manager, int currentPage, int pageSize) {
		List list = new ArrayList<>();
		StringBuffer countSql = new StringBuffer("select count(1) from t_manager where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		if (manager.getMusername()!=null && !"".equals(manager.getMusername())) {
			whereSql.append(" and musername=?");
			list.add(manager.getMusername());
		}
		if (!"".equals(manager.getMsex()) && manager.getMsex()!=null) {
			whereSql.append(" and msex=?");
			list.add(manager.getMsex());
		}
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_manager t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer("");
		return (Page<Manager>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, Manager.class, list);
	}

	@Override
	public Manager queryForSingle(String musername) {
		String sql = "select * from t_manager where musername=?";
		List<Manager> list = DB.selectAll(sql, Manager.class, musername);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}


}
