package com.ypy.shopping.util;
/**
 * ͨ��JNDI�ķ�������tomcat�����õ����ݿ����ӳ�
 */
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataSourceJNDIConfig {
	public static Connection getConnection() {
		//��ʼ�����������ռ�
		Context ctx;
		try {
			ctx = new InitialContext();
			//java:/comp/envΪ�̶�·��
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			//����jdbc/mysqldsΪ����Դ��JNDI�󶨵�����
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcaleds");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
