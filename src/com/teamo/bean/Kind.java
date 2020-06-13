package com.teamo.bean;

import java.util.List;

public class Kind {
    private Integer kid;
    private String kname;
    private List<Goods> goodses;

    public Integer getKid() {
	return kid;
    }

    public void setKid(Integer kid) {
	this.kid = kid;
    }

    public String getKname() {
	return kname;
    }

    public void setKname(String kname) {
	this.kname = kname;
    }

    public List<Goods> getGoodses() {
	return goodses;
    }

    public void setGoodses(List<Goods> goodses) {
	this.goodses = goodses;
    }

}
