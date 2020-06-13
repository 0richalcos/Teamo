package com.teamo.bean;

import java.util.List;

public class Address {
    private Integer aid;
    private String adesc;
    private List<UserAddress> userAddresses;
    private List<Order> orders;

    public Integer getAid() {
	return aid;
    }

    public void setAid(Integer aid) {
	this.aid = aid;
    }

    public String getAdesc() {
	return adesc;
    }

    public void setAdesc(String adesc) {
	this.adesc = adesc;
    }

    public List<UserAddress> getUserAddresses() {
	return userAddresses;
    }

    public void setUserAddresses(List<UserAddress> userAddresses) {
	this.userAddresses = userAddresses;
    }

    public List<Order> getOrders() {
	return orders;
    }

    public void setOrders(List<Order> orders) {
	this.orders = orders;
    }

}
