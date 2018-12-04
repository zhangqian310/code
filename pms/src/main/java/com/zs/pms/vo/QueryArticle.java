package com.zs.pms.vo;

public class QueryArticle extends QueryPage  {
	private String title;
	private String mohutitle;
	private String author;
	private int channel;
	private int isremod;
    private int ishot;
    
	public String getMohutitle() {
		return mohutitle;
	}
	public void setMohutitle(String mohutitle) {
		this.mohutitle = mohutitle;
	}
	public int getIsremod() {
		return isremod;
	}
	public void setIsremod(int isremod) {
		this.isremod = isremod;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getChannel() {
		return channel;
	}
	public void setChannel(int channel) {
		this.channel = channel;
	}
	
}
