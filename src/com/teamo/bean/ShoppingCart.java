package com.teamo.bean;

import java.util.List;

public class ShoppingCart {
	private Integer sid;
	private List<GoodsShoppingCart> goodsShoppingCarts;
	private User uid;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public List<GoodsShoppingCart> getGoodsShoppingCarts() {
		return goodsShoppingCarts;
	}

	public void setGoodsShoppingCarts(List<GoodsShoppingCart> goodsShoppingCarts) {
		this.goodsShoppingCarts = goodsShoppingCarts;
	}

	public User getUid() {
		return uid;
	}

	public void setUid(User uid) {
		this.uid = uid;
	}

}
