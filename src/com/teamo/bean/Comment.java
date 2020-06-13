package com.teamo.bean;

import java.util.Date;

public class Comment {
	private Integer cid;
	private String cdesc;
	private Date ctime;
	private String cauthor;
	private BlogDesc bdid;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCdesc() {
		return cdesc;
	}

	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public String getCauthor() {
		return cauthor;
	}

	public void setCauthor(String cauthor) {
		this.cauthor = cauthor;
	}

	public BlogDesc getBdid() {
		return bdid;
	}

	public void setBdid(BlogDesc bdid) {
		this.bdid = bdid;
	}
}
