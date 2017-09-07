package org.cioos.mysql.dao;


import java.util.List;

/**
 * 
 * @author Teacher
 * 是数据层操作的公共接口，定义公共的操作方法
 * @param <K> 操作的主键类型
 * @param <V> 操作的VO类型
 */
public interface IDAO<K,V> {
	/**
	 * 完成数据的增加操作
	 * @param vo 包含要增加数据的VO类对象
	 * @return 增加成功返回true，否则返回false
	 * @throws Exception 增加中出现了错误，例如：数据已存在或数据格式错误
	 */
	public boolean doCreate(V vo) throws Exception ; 
	/**
	 * 完成数据的修改操作
	 * @param vo 包含要修改的新数据对象
	 * @return 修改成功返回true，否则返回false
	 * @throws Exception
	 */
	public boolean doUpdate(V vo) throws Exception ;
	/**
	 * 数据的删除操作，将根据数据的主键信息删除
	 * @param id 数据的主键值
	 * @return 删除成功返回true，否则返回false
	 * @throws Exception
	 */
	public boolean doRemove(K id) throws Exception ;
	/**
	 * 根据编号查找出完整的信息
	 * @param id 要查找的编号
	 * @return 如果找到了此数据，那么会将数据封装到VO对象之中返回，如果没有找到，则返回为null
	 * @throws Exception
	 */
	public V findById(K id) throws Exception ;
	/**
	 * 查找全部的数据信息
	 * @return 所有的数据信息都会以List集合返回，如果没有数据返回，则集合的长度（size()）为0
	 * @throws Exception
	 */
	public List<V> findAll() throws Exception ;
	/**
	 * 数据的分页模糊查询
	 * @param column 要查询的数据列
	 * @param keyWord 要查询的关键字
	 * @param currentPage 当前所在页
	 * @param lineSize 每页显示的数据量
	 * @return 所有的数据信息都会以List集合返回，如果没有数据返回，则集合的长度（size()）为0
	 * @throws Exception
	 */
	public List<V> findAll(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception;
	/**
	 * 取得查找数据的个数，使用COUNT()函数完成统计
	 * @param column 要查询的数据列
	 * @param keyWord 要查询的关键字
	 * @return 返回指定数据表中的数据量，如果表中没有记录返回0
	 * @throws Exception
	 */
	public Integer getAllCount(String column,String keyWord) throws Exception ;
}
