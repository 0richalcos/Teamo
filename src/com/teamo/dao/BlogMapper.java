package com.teamo.dao;

/**
 * 
 * @author 123
 *
 */

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.teamo.bean.Blog;

public interface BlogMapper {
	/**
	 * 博客主页显示
	 */
	@Select("select*from blog b,user u,blog_label bl,blog_bloglabel_relationships br  where b.u_id=u.u_id and b.b_id=br.b_id and bl.bl_id=br.bl_id")
	@ResultMap("blog")
	public List<Blog> show() throws SQLException;

	/**
	 * 博客详情
	 * 
	 */
	@Select("select * from blog b,user u,blog_label bl,blog_bloglabel_relationships br,blog_desc bd,comment c  where b.u_id=u.u_id and b.b_id=br.b_id and bl.bl_id=br.bl_id and bd.b_id=b.b_id and c.bd_id=bd.bd_id and b.b_id=#{id}")
	@ResultMap("blog")
	public Blog current(@Param("id") int id) throws SQLException;

	/**
	 * 增加评论
	 */
	@Insert("insert into comment(c_desc,c_time,c_author,bd_id) values(#{cdesc},#{ctime},#{author},#{bdid})")
	public int add(@Param("cdesc") String cdesc, @Param("ctime") Date ctime, @Param("author") String author,
			@Param("bdid") Integer bdid) throws SQLException;
}
