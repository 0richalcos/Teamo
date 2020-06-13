package com.teamo.bean;

public class OrderGoods {
	private Integer ogid;
	private Goods gid;
	private Order oid;
	private Integer ogsum;

	public Integer getOgid() {
		return ogid;
	}

	public void setOgid(Integer ogid) {
		this.ogid = ogid;
	}

	public Goods getGid() {
		return gid;
	}

	public void setGid(Goods gid) {
		this.gid = gid;
	}

	public Order getOid() {
		return oid;
	}

	public void setOid(Order oid) {
		this.oid = oid;
	}

	public Integer getOgsum() {
		return ogsum;
	}

	public void setOgsum(Integer ogsum) {
		this.ogsum = ogsum;
	}
}
