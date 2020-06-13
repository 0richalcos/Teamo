package com.teamo.bean;

import java.util.List;

public class Label {
    private Integer lid;
    private String lname;
    private List<GoodsLabel> goodsLabels;

    public Integer getLid() {
	return lid;
    }

    public void setLid(Integer lid) {
	this.lid = lid;
    }

    public String getLname() {
	return lname;
    }

    public void setLname(String lname) {
	this.lname = lname;
    }

    public List<GoodsLabel> getGoodsLabels() {
	return goodsLabels;
    }

    public void setGoodsLabels(List<GoodsLabel> goodsLabels) {
	this.goodsLabels = goodsLabels;
    }

}
