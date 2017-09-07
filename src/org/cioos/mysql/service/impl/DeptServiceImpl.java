package org.cioos.mysql.service.impl;


import java.util.List;

import org.cioos.mysql.dbc.DatabaseConnection;
import org.cioos.mysql.factory.DAOFactory;
import org.cioos.mysql.service.IDeptService;
import org.cioos.mysql.vo.Dept;

public class DeptServiceImpl implements IDeptService {
	private DatabaseConnection dbc = new DatabaseConnection();

	@Override
	public boolean insert(Dept vo) throws Exception {
		try {
			if (DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findById(vo.getId()) == null) {
				return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
						.doCreate(vo);
			}
			return false;
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean update(Dept vo) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.doUpdate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean delete(Integer id) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.doRemove(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Dept get(Integer id) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public List<Dept> list() throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

}

