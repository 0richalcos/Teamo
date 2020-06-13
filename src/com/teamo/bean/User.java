package com.teamo.bean;

import java.util.List;

public class User {
    private Integer uid;
    private String uname;
    private String upassword;
    private String uemail;
    private List<UserAddress> userAddresses;
    private List<ShoppingCart> shoppingCarts;
    private List<Order> orders;

    public Integer getUid() {
	return uid;
    }

    public void setUid(Integer uid) {
	this.uid = uid;
    }

    public String getUname() {
	return uname;
    }

    public void setUname(String uname) {
	this.uname = uname;
    }

    public String getUpassword() {
	return upassword;
    }

    public void setUpassword(String upassword) {
	this.upassword = upassword;
    }

    public String getUemail() {
	return uemail;
    }

    public void setUemail(String uemail) {
	this.uemail = uemail;
    }

    public List<UserAddress> getUserAddresses() {
	return userAddresses;
    }

    public void setUserAddresses(List<UserAddress> userAddresses) {
	this.userAddresses = userAddresses;
    }

    public List<ShoppingCart> getShoppingCarts() {
	return shoppingCarts;
    }

    public void setShoppingCarts(List<ShoppingCart> shoppingCarts) {
	this.shoppingCarts = shoppingCarts;
    }

    public List<Order> getOrders() {
	return orders;
    }

    public void setOrders(List<Order> orders) {
	this.orders = orders;
    }

}
