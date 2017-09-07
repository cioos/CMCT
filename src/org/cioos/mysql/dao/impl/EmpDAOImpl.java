package org.cioos.mysql.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.cioos.mysql.dao.IEmpDAO;
import org.cioos.mysql.vo.Dept;
import org.cioos.mysql.vo.Emp;

public class EmpDAOImpl implements IEmpDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	/**
	 * 构造方法，用于取得数据层操作对象
	 * 
	 * @param conn
	 *            表示数据库的一个连接对象
	 */
	public EmpDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(Emp vo) throws Exception {
		String sql = "INSERT INTO tbl_emp(empno,ename,job,hiredate,sal,comm,deptno) VALUES (?,?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getId());
		this.pstmt.setString(2, vo.getEname());
		this.pstmt.setString(3, vo.getJob());
		this.pstmt.setDate(4, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(5, vo.getSal());
		this.pstmt.setDouble(6, vo.getComm());
		this.pstmt.setInt(7, 000);
//		if (vo.getMgrid() == null) { // 没有领导
//			// this.pstmt.setNull(7, Types.NULL);
//			this.pstmt.setString(7, null);
//		} else { // 有领导，需要知道领导的编号
//			this.pstmt.setInt(7, vo.getMgrid()); // 领导编号
//		}
//		if (vo.getDeptid() == null) { // 没有部门
//			this.pstmt.setString(8, null);
//		} else {
//			this.pstmt.setInt(8, vo.getDeptid()); // 部门编号
//		}
		if (this.pstmt.executeUpdate() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean doUpdate(Emp vo) throws Exception {
		String sql = "UPDATE tbl_emp SET ename=?,job=?,hiredate=?,sal=?,comm=?,mgr=?,deptno=? WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getEname());
		this.pstmt.setString(2, vo.getJob());
		this.pstmt.setDate(3, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(4, vo.getSal());
		this.pstmt.setDouble(5, vo.getComm());
		if (vo.getMgrid() == null) { // 没有领导
			// this.pstmt.setNull(7, Types.NULL);
			this.pstmt.setString(6, null);
		} else { // 有领导，需要知道领导的编号
			this.pstmt.setInt(6, vo.getMgrid()); // 领导编号
		}
		if (vo.getDept() == null) { // 没有部门
			this.pstmt.setString(7, null);
		} else {
			this.pstmt.setInt(7, vo.getDept().getDeptno()); // 部门编号
		}
		this.pstmt.setInt(8, vo.getEmpno());
		if (this.pstmt.executeUpdate() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		String sql = "DELETE FROM tbl_emp WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Emp findById(Integer id) throws Exception {
		Emp emp = null;
		String sql = "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,"
				+ " m.empno mno,m.ename mname,d.deptno dno,d.dname dna,d.loc dl "
				+ " FROM emp e, emp m ,dept d "
				+ " WHERE e.empno=? AND e.mgr=m.empno(+) AND e.deptno=d.deptno";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			Emp mgr = new Emp() ;
			mgr.setEmpno(rs.getInt(7)); 
			mgr.setEname(rs.getString(8));
			emp.setMgr(mgr);// 领导关系
			Dept dept = new Dept() ;
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			dept.setLoc(rs.getString(11));
			emp.setDept(dept);
		}
		return emp;
	}

	@Override
	public List<Emp> findAll() throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm ,"
				+ " m.empno mno,m.ename mname,d.deptno dno,d.dname dna,d.loc dl  "
				+ " FROM emp e,emp m,dept d "
				+ " WHERE e.mgr=m.empno(+)  AND e.deptno=d.deptno ";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			Emp mgr = new Emp() ;
			mgr.setEmpno(rs.getInt(7)); 
			mgr.setEname(rs.getString(8));
			emp.setMgr(mgr);// 领导关系
			Dept dept = new Dept() ;
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			dept.setLoc(rs.getString(11));
			emp.setDept(dept);
			all.add(emp); // 保存对象
		}
		return all;
	}

	@Override
	public List<Emp> findAll(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = " SELECT * FROM ( "
				+ " SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm , "
				+ " m.empno mno,m.ename mname,d.deptno dno,d.dname dna,d.loc dl "
				+ " , ROWNUM rn "
				+ " FROM emp e,emp m,dept d "
				+ " WHERE e."
				+ column
				+ " LIKE ? AND ROWNUM<=? AND e.mgr=m.empno(+)  AND e.deptno=d.deptno) temp "
				+ " WHERE temp.rn>? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setInt(2, currentPage * lineSize);
		this.pstmt.setInt(3, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setHiredate(rs.getDate(4));
			emp.setSal(rs.getDouble(5));
			emp.setComm(rs.getDouble(6));
			Emp mgr = new Emp() ;
			mgr.setEmpno(rs.getInt(7)); 
			mgr.setEname(rs.getString(8));
			emp.setMgr(mgr);// 领导关系
			Dept dept = new Dept() ;
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			dept.setLoc(rs.getString(11));
			emp.setDept(dept);
			all.add(emp); // 保存对象
		}
		return all;
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		String sql = "SELECT COUNT(empno) FROM emp WHERE " + column
				+ " LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}

}
