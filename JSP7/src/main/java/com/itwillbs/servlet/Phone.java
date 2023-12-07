package com.itwillbs.servlet;

public class Phone {

	private String model;
	private String tel;
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "Phone [model=" + model + ", tel=" + tel + "]";
	}	
	
}
