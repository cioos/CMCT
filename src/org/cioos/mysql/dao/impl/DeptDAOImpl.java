package org.cioos.mysql.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.cioos.mysql.dao.IDeptDAO;
import org.cioos.mysql.vo.Dept;

public class DeptDAOImpl implements IDeptDAO {
	private Connection conn ;
	private PreparedStatement pstmt ;
	public DeptDAOImpl(Connection conn) {
		this.conn = conn ;
	}
	@Override
	public boolean doCreate(Dept vo) throws Exception {
		String sql = "INSERT INTO tbl_dept(id,name,loc,hdeptid,mgrid,description) VALUES (?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1, vo.getId());
		this.pstmt.setString(2, vo.getName());
		this.pstmt.setString(3, vo.getLoc());
		this.pstmt.setInt(4, vo.getHdeptid());
		this.pstmt.setInt(5, vo.getMgrid());
		this.pstmt.setString(6, vo.getDescription());
		if (this.pstmt.executeUpdate() > 0) {
			return true ;
		}
		return false;
	}

	@Override
	public boolean doUpdate(Dept vo) throws Exception {
		String sql = "UPDATE dept SET dname=?,loc=? WHERE deptno=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1, vo.getName());
		this.pstmt.setString(2, vo.getLoc());
		this.pstmt.setInt(3, vo.getDeptno());
		if (this.pstmt.executeUpdate() > 0) {
			return true ;
		}
		return false;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		String sql = "DELETE FROM dept WHERE deptno=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			return true ;
		}
		return false;
	}

	@Override
	public Dept findById(Integer id) throws Exception {
		Dept dept = null ;
		String sql = "SELECT deptno,dname,loc FROM dept WHERE deptno=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery() ;
		if (rs.next()) {
			dept = new Dept() ;
			dept.setDeptno(rs.getInt(1));
			dept.setDname(rs.getString(2)); 
			dept.setLoc(rs.getString(3));
		}
		return dept ;
	}

	@Override
	public List<Dept> findAll() throws Exception {
		List<Dept> all = new ArrayList<Dept>() ;
		String sql = "SELECT deptno,dname,loc FROM dept" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		while(rs.next()) {
			Dept dept = new Dept() ;
			dept.setDeptno(rs.getInt(1));
			dept.setDname(rs.getString(2)); 
			dept.setLoc(rs.getString(3));
			all.add(dept) ;
		}
		return all;
	}

	@Override
	public List<Dept> findAll(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		throw new Exception("此方法未实现！") ;
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		throw new Exception("此方法未实现！") ;
	}

}

