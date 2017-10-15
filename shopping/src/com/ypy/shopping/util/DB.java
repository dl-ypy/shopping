package com.ypy.shopping.util;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.ypy.shopping.model.Page;

/**
 * date:2017年8月24日16:43:41
 * @author ypy
 * target:连接jdbc，实现DML与DQL语句的封装（万能增、删、改 和 万能查询）
 */
public class DB {
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	private static final String SQL_START = "select t1.* from (";
	private static final String SQL_END = ") t1 where num>?";
	
	/**
	 * 连接数据库
	 * @return
	 */
	public static Connection getConnection() {
		try {
//			DataSource  dataSource = DataSourceConfig.getDataSource();
			conn = DataSourceJNDIConfig.getConnection();
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 关闭数据库（DML）
	 * @param conn
	 * @param ps
	 */
	public static void closeDriver(Connection conn, PreparedStatement ps) {
		try {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭数据库（DQL）
	 * @param conn
	 * @param ps
	 * @param rs
	 */
	public static void closeDriver(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * DML语句封装
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int DML(String sql, Object...params) {
		int n = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			if (params.length != 0) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			n = ps.executeUpdate();
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDriver(conn, ps);
		}
		return -1;
	}
	
	/**
	 * 万能查询(DQL语句封装)
	 * @param sql sql语句
	 * @param cls 实体类的class
	 * @param params SQL语句中的参数（变参）
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> selectAll(String sql, @SuppressWarnings("rawtypes") Class cls, Object...params) {
		List<Object> list = new ArrayList<>();
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			if (params.length != 0) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			rs = ps.executeQuery();
			//获取列数
			int columnCount = rs.getMetaData().getColumnCount();
			while (rs.next()) {
				//新建对象
				Object instance = cls.newInstance();
				for (int i=1; i<=columnCount; i++) {
					//得到数据
					Object obj = rs.getObject(i);
					//判断得到的数据是否为空
					if (obj == null) {
						continue;
					}
					//得到字段名并将其转换为小写
					String columnName = rs.getMetaData().getColumnName(i).toLowerCase();
					//判断是否有该属性
					if (hasField(cls, columnName)) {
						//设置属性
						Field f = cls.getDeclaredField(columnName);
						//设置权限
						f.setAccessible(true);
						if (rs.getMetaData().getColumnTypeName(i).equals("NUMBER")) {
							BigDecimal val = (BigDecimal) obj;
							if (f.getType().getName().equals("int")) {
								f.set(instance, val.intValue());
							} else {
								f.set(instance, val.doubleValue());
							}
						} else {
							//将得到数据库的数据设置到对应对象的属性中
							f.set(instance, obj);
						}
					}
				}
				list.add(instance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDriver(conn, ps, rs);
		}
		return (List<T>) list;
	}

	/**
	 * 判断cls类中是否有属性columnName
	 * @param cls
	 * @param columnName
	 * @return
	 */
	private static boolean hasField(@SuppressWarnings("rawtypes") Class cls, String columnName) {
		Field[] fields = cls.getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			if (fields[i].getName().equals(columnName)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 查询总记录数
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int queryForCount(String sql, Object...params) {
		conn = getConnection();
		try {
			ps = conn.prepareStatement(sql);
			if (params.length != 0) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);//返回总记录数
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDriver(conn, ps, rs);
		}
		return 0;
	}
	
	/**
	 * 分页查询
	 * @param otherSql
	 * @param countSql
	 * @param whereSql
	 * @param querySql
	 * @param currentPage
	 * @param pageSize
	 * @param clas
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T>Page<T> queryPage(StringBuffer otherSql, StringBuffer countSql, StringBuffer whereSql, StringBuffer querySql, int currentPage, int pageSize, Class<T> clas, @SuppressWarnings("rawtypes") List params) {
		//获得总记录数
		String sql = countSql.append(whereSql).toString();
		int totalCount = queryForCount(sql, params.toArray());
		//计算总页数
		int pageCount = (totalCount-1)/pageSize+1;
		//获得每页开始与结束下脚标
		int startIndex = pageSize*(currentPage-1);
		int endIndex = pageSize*currentPage;
		params.add(0, endIndex);
		params.add(startIndex);
		if (currentPage == pageCount) {
			endIndex = totalCount;
		}
		//拼接分页查询的语句
		sql = querySql.append(whereSql).append(otherSql).insert(0, SQL_START).append(SQL_END).toString();
		System.out.println(sql);
		List<T> list = selectAll(sql, clas, params.toArray());
		return new Page<T>(pageSize, currentPage, totalCount, pageCount, startIndex, endIndex, list);
	}
}
