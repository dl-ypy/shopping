package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;
import com.ypy.shopping.dao.IUserDao;
import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.util.DB;

public class IUserDaoImpl implements IUserDao {
	String sql = "";
	@Override
	public int addUser(User user) {
		sql = "insert into t_user values(seq_t_user.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return DB.DML(sql, user.getUsername(),user.getPassword(),user.getTruename(),user.getUsersex(),user.getBirthday(),user.getEmail(),user.getPhoneno(),user.getPostcade(),user.getAddress(),user.getRegdate(),user.getLockstate(),user.getLastaccess(),user.getLogin());
	}

	@Override
	public int updateUser(User user) {
		List param=new ArrayList();
		StringBuffer sql=new StringBuffer("update t_user set ");
		if(!"".equals(user.getUsername())&&user.getUsername()!=null) {
			sql.append("username=?,");
			param.add(user.getUsername());			
		}
		if(!"".equals(user.getPassword())&&user.getPassword()!=null) {
			sql.append("password=?,");
			param.add(user.getPassword());	
		}
		if(!"".equals(user.getTruename())&&user.getTruename()!=null) {
			sql.append("truename=?,");
			param.add(user.getTruename());	
		}
		if(!"".equals(user.getEmail())&&user.getEmail()!=null) {
			sql.append("email=?,");
			param.add(user.getEmail());	
		}
		if(!"".equals(user.getPhoneno())&&user.getPhoneno()!=null) {
			sql.append("phoneno=?,");
			param.add(user.getPhoneno());	
		}
		if(!"".equals(user.getPostcade())&&user.getPostcade()!=null) {
			sql.append("postcade=?,");
			param.add(user.getPostcade());	
		}
		if(!"".equals(user.getAddress())&&user.getAddress()!=null) {
			sql.append("address=?,");
			param.add(user.getAddress());	
		}
		if(!"".equals(user.getLockstate())&&user.getLockstate()!=null) {
			sql.append("lockstate=?,");
			param.add(user.getLockstate());	
		}
		if(!"".equals(user.getLastaccess())&&user.getLastaccess()!=null) {
			sql.append("lastaccess=?,");
			param.add(user.getLastaccess());	
		}
		if(user.getLogin() != 0) {
			sql.append("login=?,");
			param.add(user.getLogin());	
		}
		//判断最后一个是否是逗号
		if (',' == (sql.charAt(sql.length()-1))) {
			sql.replace(sql.length()-1, sql.length(), "");
		}
		sql.append(" where userid=?");
		param.add(user.getUserid());
		return DB.DML(sql.toString(), param.toArray());
	}

	@Override
	public User queryForSingle(String username, String password) {
		sql = "select * from t_user where username=? and password=?";
		List<User> list = DB.selectAll(sql, User.class, username, password);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<User> queryAll(User user) {
		sql = "select * from t_user";
		return DB.selectAll(sql, User.class);
	}

	@Override
	public int deleteUser(User user) {
		sql = "delete from t_user where userid = ?";
		return DB.DML(sql, user.getUserid());
	}

	@Override
	public Page<User> queryPage(User user, int currentPage, int pageSize) {
		List list = new ArrayList<>();
		StringBuffer countSql = new StringBuffer("select count(1) from t_user where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		if (user.getUsername()!=null && !"".equals(user.getUsername())) {
			whereSql.append(" and username=?");
			list.add(user.getUsername());
		}
		if (!"-1".equals(user.getUsersex()) && !"".equals(user.getUsersex()) && user.getUsersex()!=null) {
			whereSql.append(" and usersex=?");
			list.add(user.getUsersex());
		}
		if (!"-1".equals(user.getLockstate()) && !"".equals(user.getLockstate()) && user.getLockstate()!=null) {
			whereSql.append(" and lockstate=?");
			list.add(user.getLockstate());
		}
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_user t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer("");
		return (Page<User>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, User.class, list);
	}

	@Override
	public User queryForSingle(int userid) {
		String sql = "select * from t_user where userid=?";
		List<User> list = DB.selectAll(sql, User.class, userid);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public User queryForSingle(String username) {
		sql = "select * from t_user where username=?";
		List<User> list = DB.selectAll(sql, User.class, username);
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

}
