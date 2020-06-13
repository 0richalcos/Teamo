package com.teamo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.teamo.bean.GoodsShoppingCart;

/**
 * 购物车映射器类
 * 
 * @author Orichalcos
 *
 */

public interface ShoppingCartMapper {
	/**
	 * 查询用户购物车的所有商品
	 * 
	 * @param user 登录的用户
	 * @return 多个商品
	 * @throws SQLException
	 */
	@Select("SELECT * FROM user u, shopping_cat s, goods_shopping_relationships sg, goods g WHERE u.u_id=s.u_id AND s.s_id=sg.s_id AND sg.g_id=g.g_id AND u.u_id=#{uid} ")
	@ResultMap("goodsShoppingCart")
	public List<GoodsShoppingCart> list(@Param("uid") int uid) throws SQLException;

	/**
	 * 删除购物车的商品
	 * 
	 * @param uid 用户ID
	 * @param gid 商品ID
	 * @return 受影响行数
	 * @throws SQLException
	 */
	@Delete("DELETE FROM goods_shopping_relationships sg WHERE sg.s_id=(SELECT s.s_id FROM shopping_cat s, user u WHERE u.u_id=s.u_id AND u.u_id=#{uid}) AND sg.g_id=#{gid}")
	public int deleteGoods(@Param("uid") int uid, @Param("gid") int gid) throws SQLException;

	/**
	 * 修改购物车内商品数量
	 * 
	 * @param sum 商品数量
	 * @return 受影响行数
	 * @throws SQLException
	 */
	public int updateSum(@Param("flag") boolean flag, @Param("id") int id) throws SQLException;

	/**
	 * 添加商品进购物车
	 * 
	 * @param uid   用户ID
	 * @param goods 商品
	 * @return 受影响行数
	 * @throws SQLException
	 */
	@Insert("INSERT INTO goods_shopping_relationships(s_id,g_id,sg_sum) VALUES (#{sid},#{gid},#{sgsum})")
	public int addGoods(@Param("sid") int sid, @Param("gid") int gid, @Param("sgsum") int sgsum) throws SQLException;
}
