package com.teamo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.teamo.bean.Order;
import com.teamo.bean.User;

public interface OrderMapper {
	/**
	 * 生成订单
	 * 
	 * @return
	 * @throws SQLException
	 */
	@Insert("INSERT INTO `order`(o_time,u_id,a_id,o_dawk,o_phone) VALUES(#{date},#{uid},#{aid},#{odawk},#{ophone})")
	public int create(@Param("date") String date, @Param("uid") int uid, @Param("aid") int aid, @Param("odawk") String odawk, @Param("ophone") String ophone) throws SQLException;

	/**
	 * 通过用户ID查找用户信息
	 * 
	 * @param uid 用户ID
	 * @return 用户
	 * @throws SQLException
	 */
	@Select("select * from user u, address a, user_address_relationships ua where  ua.a_id=a.a_id and ua.u_id=u.u_id and u.u_id=#{uid}")
	@ResultMap("user")
	public User findOrder(@Param("uid") int uid) throws SQLException;

	/**
	 * 通过时间戳查找订单ID
	 * 
	 * @param uid 用户ID
	 * @return 订单ID
	 * @throws SQLException
	 */
	@Select("select o.o_id from `order` o where o.o_time=#{date}")
	public int findOrderID(@Param("date") String date) throws SQLException;

	/**
	 * 生成订单关系表
	 * 
	 * @param gid   商品ID
	 * @param oid   订单ID
	 * @param ogsum 商品数量
	 * @return 受影响行数
	 * @throws SQLException
	 */
	@Insert("insert into order_goods_realtionships(g_id,o_id,og_sum) values(#{gid},#{oid},#{ogsum})")
	public int inserOrderDesc(@Param("gid") int gid, @Param("oid") int oid, @Param("ogsum") int ogsum) throws SQLException;

	/**
	 * 通过用户ID查找其所有的订单
	 * 
	 * @param uid 用户ID
	 * @return 所有订单
	 * @throws SQLException
	 */
	@Select("SELECT * FROM `user` u, `order` o, order_goods_realtionships og, goods g, address a WHERE a.a_id=o.a_id AND o.u_id=u.u_id AND o.o_id=og.o_id AND og.g_id=g.g_id AND u.u_id=#{uid}")
	@ResultMap("order")
	public List<Order> findOrderByUserID(@Param("uid") int uid) throws SQLException;
}
