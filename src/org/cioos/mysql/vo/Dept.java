package org.cioos.mysql.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Dept implements Serializable {
	private Integer id ;
	private Integer hdeptid;
	private String name ;
	private String loc ;
	private Integer mgrid;
	private String description;
//	private List<Emp> allEmps ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHdeptid() {
		return hdeptid;
	}
	public void setHdeptid(Integer hdeptid) {
		this.hdeptid = hdeptid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public Integer getMgrid() {
		return mgrid;
	}
	public void setMgrid(Integer mgrid) {
		this.mgrid = mgrid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}

