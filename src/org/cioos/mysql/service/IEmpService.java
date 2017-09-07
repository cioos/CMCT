package org.cioos.mysql.service;

import java.util.List;
import java.util.Map;

import org.cioos.mysql.vo.Emp;

public interface IEmpService {
	/**
	 * 实现雇员数据的增加操作，此时需要调用IEmpDAO接口如下操作：<br>
	 * <li>判断要增加的雇员编号是否存在，可以根据findById()方法的返回值是否为null来决定；
	 * <li>调用doCreate()方法执行数据的保存。
	 * @param vo 要增加的数据对象
	 * @return 如果增加成功返回true，否则返回false
	 * @throws Exception
	 */
	public boolean insert(Emp vo) throws Exception ;
	/**
	 * 实现雇员数据的修改操作，此时需要调用IEmpDAO接口如下操作：<br>
	 * <li>调用doUpdate()方法执行数据更新；
	 * @param vo 包含新数据的数据对象
	 * @return 如果增加成功返回true，否则返回false
	 * @throws Exception
	 */
	public boolean update(Emp vo) throws Exception ;
	/**
	 * 实现雇员数据的删除操作，此时需要调用IEmpDAO接口如下操作：<br>
	 * <li>调用doRemove()方法执行数据删除；
	 * @param id 要删除的数据编号
	 * @return 删除成功返回true，否则返回false
	 * @throws Exception
	 */
	public boolean delete(Integer id) throws Exception ;
	/**
	 * 根据雇员编号查找到雇员的完整信息，调用IEmpDAO接口如下操作：<br>
	 * <li>调用findById()方法
	 * @param id 要查询的id
	 * @return 如果查找到则返回实例化对象，否则返回null
	 * @throws Exception
	 */
	public Emp get(Integer id) throws Exception ;
	/**
	 * 查询全部数据，调用IEmpDAO接口如下操作：<br>
	 * <li>调用findAll()方法
	 * @return 以集合的方式返回全部数据，如果没有数据，则集合长度为0
	 * @throws Exception
	 */
	public List<Emp> findAll() throws Exception ;
	/**
	 * 分页模糊查询数据，本操作要调用IEmpDAO接口如下操作：<br>
	 * <li>调用findAll()进行模糊的分页数据查找；
	 * <li>调用getAllCount()查找满足条件的数据量；
	 * @param column 模糊查询的列
	 * @param keyWord 查询关键字
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据行
	 * @return 由于此处要返回两种类型（List<Emp>、Integer），所以使用Map返回，此时的key要求如下：<br>
	 * <li> key = allEmps，表示接收findAll()方法的返回结果；
	 * <li> key = empCount，表示接收getAllCount()方法的返回结果
	 * @throws Exception
	 */
	public Map<String, Object> findAll(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception;
}
