package com.teamo.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.teamo.bean.User;

public interface UserMapper {

	@Insert("insert into user(u_name,u_password,u_email) value(#{uname},#{upassword},#{uemail})")

	// 用户注册(实现注册和邮箱验证功能完成注册)
	public int reg(User user) throws SQLException;

	@Select("select*from user u,shopping_cat s where u.u_id=s.u_id and u.u_name=#{uname} and u.u_password=#{upassword}")
	// 用户登录(实现记住密码，自动登录，密码加密)
	@ResultMap("user")
	// 用户登录(实现记住密码，自动登录，密码加密)
	public User login(User user) throws SQLException;

	// 用户注销(从本地中删除用户)
	public int logout(int id) throws SQLException;

	// 增加购物车
	@Insert("insert shopping_cat(u_id) values(#{uid})")
	public int addCart(@Param("uid") int uid) throws SQLException;

	// 通过用户名查找用户ID
	@Select("select user.u_id from user where user.u_name=#{name}")
	public int findUserID(@Param("name") String name) throws SQLException;

	/**
	 * 添加地址
	 * 
	 * @param address 地址信息
	 * @return 受影响行数
	 * @throws SQLException
	 */
	@Insert("insert into address(a_desc) values(#{address})")
	public int addAddress(@Param("address") String address) throws SQLException;

	/**
	 * 添加用户地址关系表
	 * 
	 * @param uid 用户ID
	 * @param aid 地址ID
	 * @return 受影响行数
	 * @throws SQLException
	 */
	@Insert("insert into user_address_relationships(u_id,a_id) values(#{uid},#{aid})")
	public int addAddressRelation(@Param("uid") int uid, @Param("aid") int aid) throws SQLException;

	@Select("select address.a_id from address where address.a_desc=#{address}")
	public int findAddressID(@Param("address") String address) throws SQLException;

}
