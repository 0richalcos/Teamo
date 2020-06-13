package com.teamo.bean;

public class BlogLabelRelationships {
	private Integer bbid;
	private Blog bid;
	private BlogLabel blid;
	
	public Integer getBbid() {
		return bbid;
	}
	public void setBbid(Integer bbid) {
		this.bbid = bbid;
	}
	public Blog getBid() {
		return bid;
	}
	public void setBid(Blog bid) {
		this.bid = bid;
	}
	public BlogLabel getBlid() {
		return blid;
	}
	public void setBlid(BlogLabel blid) {
		this.blid = blid;
	}
	
}
