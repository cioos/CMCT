package org.cioos.mysql.factory;

import java.sql.Connection;

import org.cioos.mysql.dao.IDeptDAO;
import org.cioos.mysql.dao.IEmpDAO;
import org.cioos.mysql.dao.impl.DeptDAOImpl;
import org.cioos.mysql.dao.impl.EmpDAOImpl;

public class DAOFactory {
	/**
	 * 取得IEmpDAO接口对象，此操作会由业务层调用
	 * @param conn 提供一个数据库连接，没有此对象，子类无法操作
	 * @return IEmpDAO接口的实例化对象
	 */
	public static IEmpDAO getIEmpDAOInstance(Connection conn) {
		return new EmpDAOImpl(conn) ;
	}
	public static IDeptDAO getIDeptDAOInstance(Connection conn) {
		return new DeptDAOImpl(conn) ;
	}
}
