package com.teamo.bean;

public class GoodsShoppingCart {
    private Integer sgid;
    private ShoppingCart sid;
    private Goods gid;
    private Integer sgsum;

    public Integer getSgid() {
	return sgid;
    }

    public void setSgid(Integer sgid) {
	this.sgid = sgid;
    }

    public ShoppingCart getSid() {
	return sid;
    }

    public void setSid(ShoppingCart sid) {
	this.sid = sid;
    }

    public Goods getGid() {
	return gid;
    }

    public void setGid(Goods gid) {
	this.gid = gid;
    }

    public Integer getSgsum() {
	return sgsum;
    }

    public void setSgsum(Integer sgsum) {
	this.sgsum = sgsum;
    }

}
