package org.cioos.mysql.service;

import java.util.List;

import org.cioos.mysql.vo.Dept;

public interface IDeptService {
	public boolean insert(Dept vo) throws Exception ;
	public boolean update(Dept vo) throws Exception ;
	public boolean delete(Integer id) throws Exception ;
	public Dept get(Integer id) throws Exception ;
	public List<Dept> list() throws Exception ;
}
