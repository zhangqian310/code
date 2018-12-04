package com.zs.pms.vo;

public class QueryAdvert extends QueryPage  {
	private String title;
	private String mohutitle;
	private int creator;
	
	public String getMohutitle() {
		return mohutitle;
	}
	public void setMohutitle(String mohutitle) {
		this.mohutitle = mohutitle;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
