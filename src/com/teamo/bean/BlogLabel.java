package com.teamo.bean;

import java.util.List;

public class BlogLabel {
	private Integer blid;
	private String bllabel;
	private List<BlogLabelRelationships> blogLabelRelationshipses;
	
	public List<BlogLabelRelationships> getBlogLabelRelationshipses() {
		return blogLabelRelationshipses;
	}
	public void setBlogLabelRelationshipses(List<BlogLabelRelationships> blogLabelRelationshipses) {
		this.blogLabelRelationshipses = blogLabelRelationshipses;
	}
	public Integer getBlid() {
		return blid;
	}
	public void setBlid(Integer blid) {
		this.blid = blid;
	}
	public String getBllabel() {
		return bllabel;
	}
	public void setBllabel(String bllabel) {
		this.bllabel = bllabel;
	}
	
}
