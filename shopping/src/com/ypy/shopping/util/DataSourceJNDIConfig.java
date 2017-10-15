package com.ypy.shopping.util;
/**
 * 通过JNDI的方法连接tomcat中配置的数据库连接池
 */
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataSourceJNDIConfig {
	public static Connection getConnection() {
		//初始化查找命名空间
		Context ctx;
		try {
			ctx = new InitialContext();
			//java:/comp/env为固定路径
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			//参数jdbc/mysqlds为数据源和JNDI绑定的名字
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcaleds");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
