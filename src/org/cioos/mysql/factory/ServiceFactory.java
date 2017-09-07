package org.cioos.mysql.factory;

import org.cioos.mysql.service.IDeptService;
import org.cioos.mysql.service.IEmpService;
import org.cioos.mysql.service.impl.DeptServiceImpl;
import org.cioos.mysql.service.impl.EmpServiceImpl;

public class ServiceFactory {
	public static IEmpService getIEmpServiceInstance() {
		return new EmpServiceImpl() ; 
	}
	public static IDeptService getIDeptServiceInstance() {
		return new DeptServiceImpl() ;
	}
}
