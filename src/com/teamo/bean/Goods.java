package com.teamo.bean;

import java.util.List;

public class Goods {
	private Integer gid;
	private String gname;
	private String gdesc;
	private Double gprice;
	private String gsize;
	private String gcolor;
	private String gimg;
	private Kind kid;
	private List<GoodsShoppingCart> goodsShoppingCarts;
	private List<GoodsLabel> goodsLabels;
	private List<OrderGoods> orderGoodses;

	public List<OrderGoods> getOrderGoodses() {
		return orderGoodses;
	}

	public void setOrderGoodses(List<OrderGoods> orderGoodses) {
		this.orderGoodses = orderGoodses;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGdesc() {
		return gdesc;
	}

	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}

	public Double getGprice() {
		return gprice;
	}

	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public String getGimg() {
		return gimg;
	}

	public void setGimg(String gimg) {
		this.gimg = gimg;
	}

	public Kind getKid() {
		return kid;
	}

	public void setKid(Kind kid) {
		this.kid = kid;
	}

	public List<GoodsShoppingCart> getGoodsShoppingCarts() {
		return goodsShoppingCarts;
	}

	public void setGoodsShoppingCarts(List<GoodsShoppingCart> goodsShoppingCarts) {
		this.goodsShoppingCarts = goodsShoppingCarts;
	}

	public List<GoodsLabel> getGoodsLabels() {
		return goodsLabels;
	}

	public void setGoodsLabels(List<GoodsLabel> goodsLabels) {
		this.goodsLabels = goodsLabels;
	}

}
