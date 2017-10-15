package com.ypy.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.ypy.shopping.dao.IMcDao;
import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.util.DB;

public class IMcDaoimpl implements IMcDao {
	String sql = "";

	@Override
	public int add(Mc mc) {
		sql = "insert into t_mc values(seq_t_mc.nextval,?,?,?,?,?,?,?,?)";
		return DB.DML(sql, mc.getMcname(),mc.getMcdecx(),mc.getPrice(),mc.getPic(),mc.getFlag(),mc.getSmalltypeid(),mc.getCreatedate(),mc.getQuantity());
	}

	@Override
	public int delete(int id) {
		sql = "delete from t_mc where mcid=?";
		return DB.DML(sql, id);
	}
	
	@Override
	public int deleteS(int id) {
		sql = "delete from t_mc where smalltypeid=?";
		return DB.DML(sql, id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public int update(Mc mc) {
		List param=new ArrayList();
		StringBuffer sql=new StringBuffer("update t_mc set ");
		if(!("".equals(mc.getMcname()))&&mc.getMcname()!=null) {
			sql.append("mcname=?,");
			param.add(mc.getMcname());			
		}
		if(!"".equals(mc.getMcdecx())&&mc.getMcdecx()!=null) {
			sql.append("mcdecx=?,");
			param.add(mc.getMcdecx());	
		}
		if(!"".equals(mc.getPrice())) {
			sql.append("price=?,");
			param.add(mc.getPrice());	
		}
		if(!"".equals(mc.getPic())&&mc.getPic()!=null) {
			sql.append("pic=?,");
			param.add(mc.getPic());	
		}
		if(!"".equals(mc.getFlag())&&mc.getFlag()!=null) {
			sql.append("flag=?,");
			param.add(mc.getFlag());	
		}
		if(!"".equals(mc.getSmalltypeid())&&mc.getSmalltypeid()!=0) {
			sql.append("smalltypeid=?,");
			param.add(mc.getSmalltypeid());	
		}
		if(!"".equals(mc.getCreatedate())&&mc.getCreatedate()!=null) {
			sql.append("createdate=?,");
			param.add(mc.getCreatedate());	
		}
		if(!"".equals(mc.getQuantity())) {
			sql.append("quantity=?,");
			param.add(mc.getQuantity());	
		}
		//判断最后一个是否是逗号
		if (',' == (sql.charAt(sql.length()-1))) {
			sql.replace(sql.length()-1, sql.length(), "");
		}
		sql.append(" where mcid=?");
		param.add(mc.getMcid());
		return DB.DML(sql.toString(), param.toArray());
	}

	@Override
	public Mc queryForSingle(Mc mc) {
		String sql="select * from t_mc where mcid=?"; 
		List<Mc> list = DB.selectAll(sql, Mc.class, mc.getMcid());
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Mc> queryAll(Mc mc) {
		String sql="select * from t_mc where 1=1";
		return DB.selectAll(sql, Mc.class);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public <T> Page<T> queryPage(Mc mc, int currentPage, int pageSize) {
		List list = new ArrayList<>();
		StringBuffer countSql = new StringBuffer("select count(1) from t_mc where 1=1");
		StringBuffer whereSql = new StringBuffer("");
		if (mc.getMcname()!=null && !"".equals(mc.getMcname())) {
			whereSql.append(" and mcname like ?");
			list.add("%"+mc.getMcname()+"%");
		}
		if (mc.getSmalltypeid() != 0) {
			whereSql.append(" and smalltypeid=?");
			list.add(mc.getSmalltypeid());
		}
		if (mc.getFlag()!=null && !"".equals(mc.getFlag())) {
			whereSql.append(" and flag=?");
			list.add(mc.getFlag());
		}
		if (mc.getPrice() != -1) {
			switch ((int)mc.getPrice()) {
			case 0:
				whereSql.append(" and price>=? and price<=100");
				list.add(mc.getPrice());
				break;
			case 100:
				whereSql.append(" and price>=? and price<=500");
				list.add(mc.getPrice());
				break;
			case 500:
				whereSql.append(" and price>=? and price<=1000");
				list.add(mc.getPrice());
				break;
			case 1000:
				whereSql.append(" and price>=? and price<=5000");
				list.add(mc.getPrice());
				break;
			case 5000:
				whereSql.append(" and price>?");
				list.add(mc.getPrice());
				break;

			default:
				break;
			}
		}
		StringBuffer querySql = new StringBuffer("select t2.*,rownum num from t_mc t2 where rownum<=?");
		StringBuffer otherSql = new StringBuffer("");
		return (Page<T>) DB.queryPage(otherSql, countSql, whereSql, querySql, currentPage, pageSize, Mc.class, list);
	}
}
