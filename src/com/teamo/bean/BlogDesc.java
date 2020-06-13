package com.teamo.bean;

import java.util.List;

public class BlogDesc {
	private Integer bdid;
	private String bdone;
	private String bdtwo;
	private Blog bid;
	private List<Comment> commentes;

	public List<Comment> getCommentes() {
		return commentes;
	}

	public void setCommentes(List<Comment> commentes) {
		this.commentes = commentes;
	}

	public Integer getBdid() {
		return bdid;
	}

	public void setBdid(Integer bdid) {
		this.bdid = bdid;
	}

	public String getBdone() {
		return bdone;
	}

	public void setBdone(String bdone) {
		this.bdone = bdone;
	}

	public String getBdtwo() {
		return bdtwo;
	}

	public void setBdtwo(String bdtwo) {
		this.bdtwo = bdtwo;
	}

	public Blog getBid() {
		return bid;
	}

	public void setBid(Blog bid) {
		this.bid = bid;
	}
}
