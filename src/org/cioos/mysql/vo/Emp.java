package org.cioos.mysql.vo;


import java.io.Serializable;
import java.util.Date;
/**   
 * 包名称： org.cioos.mysql.vo 
 * 类名称：Emp  
 * 类描述：雇员vo执行sql时被daoimpl层调用
 * @version 1
 * TODO     
 */   
@SuppressWarnings("serial")
public class Emp implements Serializable {
	private Integer id ;		//编号
	private String ename ;	    //姓名
	private String job ;	    //工作
	private Date hiredate ;		//入职日期
	private Double sal ;	    //
	private Double comm ;	    //
	private Integer mgrid ;	        //领导
	private Integer deptid ;        //部门
	private String email;//电子邮件
	private String mobile;//手机
	private String description;
	private String sex;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public Double getSal() {
		return sal;
	}
	public void setSal(Double sal) {
		this.sal = sal;
	}
	public Double getComm() {
		return comm;
	}
	public void setComm(Double comm) {
		this.comm = comm;
	}
	public Integer getMgrid() {
		return mgrid;
	}
	public void setMgrid(Integer mgrid) {
		this.mgrid = mgrid;
	}
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
}

