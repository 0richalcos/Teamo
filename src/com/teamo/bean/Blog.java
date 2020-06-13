package com.teamo.bean;

import java.util.List;

public class Blog {
	private Integer bid;
	private String btitle;
	private String bimg;
	private String bintro;
	private List<BlogLabelRelationships> blogLabelRelationshipses;
	private BlogDesc blogdesc;
	private User uid;
	private String bbigimg;
	

	public String getBbigimg() {
		return bbigimg;
	}

	public void setBbigimg(String bbigimg) {
		this.bbigimg = bbigimg;
	}

	public BlogDesc getBlogdesc() {
		return blogdesc;
	}

	public void setBlogdesc(BlogDesc blogdesc) {
		this.blogdesc = blogdesc;
	}


	public List<BlogLabelRelationships> getBlogLabelRelationshipses() {
		return blogLabelRelationshipses;
	}

	public void setBlogLabelRelationshipses(List<BlogLabelRelationships> blogLabelRelationshipses) {
		this.blogLabelRelationshipses = blogLabelRelationshipses;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBimg() {
		return bimg;
	}

	public void setBimg(String bimg) {
		this.bimg = bimg;
	}

	public String getBintro() {
		return bintro;
	}

	public void setBintro(String bintro) {
		this.bintro = bintro;
	}

	public User getUid() {
		return uid;
	}

	public void setUid(User uid) {
		this.uid = uid;
	}

}
