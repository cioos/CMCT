package org.cioos.mysql.dbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * @author Teacher
 * 此类的功能主要负责连接数据库，每当实例化此类对象，就表示要打开一个新的数据库连接
 */
@SuppressWarnings("unused")
public class DatabaseConnection {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver" ;
	private static final String DBURL = "jdbc:mysql://localhost:3306/wcst" ;
	private static final String DBUSER = "root" ;
	private static final String PASSWORD = "123456" ;
	private Connection conn ; 	// 保存数据库的连接
	/**
	 * 在此构造方法之中需要取得数据库的连接对象
	 * 如果在此处出现了错误信息，那么程序一定都无法运行，也不是程序可以解决的，此异常自己处理了
	 */
	public DatabaseConnection() {
		try {
			Class.forName(DBDRIVER) ;
			this.conn = DriverManager.getConnection(DBURL,DBUSER,PASSWORD) ;
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}
	/**
	 * 取得数据库连接
	 * @return 如果已连接数据库会返回一个Connection接口对象，如果未连接，返回null
	 */
	public Connection getConnection() {
		return this.conn ;
	}
	/**
	 * 关闭数据库连接
	 */
	public void close() {
		try {
			if (this.conn != null) {	// 已经确实连接上了
				this.conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}
}

