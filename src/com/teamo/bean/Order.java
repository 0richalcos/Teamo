package com.teamo.bean;

import java.util.Date;
import java.util.List;

public class Order {
	private Integer oid;
	private Date otime;
	private String odawk;
	private String oname;
	private String ophone;
	private User uid;
	private Address aid;
	private List<OrderGoods> orderGoodses;

	public List<OrderGoods> getOrderGoodses() {
		return orderGoodses;
	}

	public void setOrderGoodses(List<OrderGoods> orderGoodses) {
		this.orderGoodses = orderGoodses;
	}

	public String getOdawk() {
		return odawk;
	}

	public void setOdawk(String odawk) {
		this.odawk = odawk;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Date getOtime() {
		return otime;
	}

	public void setOtime(Date otime) {
		this.otime = otime;
	}

	public User getUid() {
		return uid;
	}

	public void setUid(User uid) {
		this.uid = uid;
	}

	public Address getAid() {
		return aid;
	}

	public void setAid(Address aid) {
		this.aid = aid;
	}

}
