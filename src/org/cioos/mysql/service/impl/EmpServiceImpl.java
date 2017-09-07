package org.cioos.mysql.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cioos.mysql.dbc.DatabaseConnection;
import org.cioos.mysql.factory.DAOFactory;
import org.cioos.mysql.service.IEmpService;
import org.cioos.mysql.vo.Emp;

public class EmpServiceImpl implements IEmpService {
	/**
	 * 如果要使用此类，一定表示要进行数据操作，所以直接将数据库连接类作为类属性出现
	 */
	private DatabaseConnection dbc = new DatabaseConnection() ;
	@Override
	public boolean insert(Emp vo) throws Exception {
		try {
			if (DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findById(vo.getId()) == null) {	// 增加雇员不存在
				return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
						.doCreate(vo);
			}
			return false;
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}

	@Override
	public boolean update(Emp vo) throws Exception {
		try {
			// IEmpDAO dao =
			// DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()) ;
			// return dao.doUpdate(vo);
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.doUpdate(vo); 
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}

	@Override
	public boolean delete(Integer id) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.doRemove(id);
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}

	@Override
	public Emp get(Integer id) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findById(id);
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}

	@Override
	public List<Emp> findAll() throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findAll();
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}

	@Override
	public Map<String, Object> findAll(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		try {
			Map<String,Object> map = new HashMap<String,Object>() ;
			map.put("allEmps",
					DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
							.findAll(column, keyWord, currentPage, lineSize));
			map.put("empCount",
					DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
							.getAllCount(column, keyWord));
			return map;
		} catch (Exception e) {
			throw e ;
		} finally {
			this.dbc.close(); 
		}
	}
}

