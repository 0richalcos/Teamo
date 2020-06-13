package com.teamo.bean;

public class UserAddress {
    private Integer uaid;
    private User uid;
    private Address aid;

    public Integer getUaid() {
	return uaid;
    }

    public void setUaid(Integer uaid) {
	this.uaid = uaid;
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
