package com.teamo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.teamo.bean.Goods;

/**
 * 
 * @author 龙
 *
 */
public interface GoodsMapper {

	/**
	 * 商品显示
	 * 
	 * @return
	 * @throws SQLException
	 */
	@Select("select*from goods limit #{id},#{uid}")
	@ResultMap("goods")
	public List<Goods> show(@Param("id") int id, @Param("uid") int dd) throws SQLException;

	/**
	 * 商品显示
	 * 
	 * @return
	 * @throws SQLException
	 */
	@Select("SELECT*FROM goods LIMIT  #{id},#{dd}")
	@ResultMap("goods")
	public List<Goods> list(@Param("id") int id, @Param("dd") int dd) throws SQLException;

	/**
	 * 商品搜索
	 * 
	 * @param name()
	 * @return
	 * @throws SQLException
	 */
	public List<Goods> search(@Param("str") String name) throws SQLException;

	/**
	 * 详情
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Select("SELECT*FROM goods g,goods_label_relationships gl,label l where g.g_id=#{id} and g.g_id=gl.g_id and gl.l_id=l.l_id")
	@ResultMap("goods")
	public List<Goods> sum(@Param("id") int id) throws SQLException;
	
	/**
	 * 查询商品所有数量
	 */
	@Select("select count(*) from goods")
	public int showSum() throws SQLException;
	
}
