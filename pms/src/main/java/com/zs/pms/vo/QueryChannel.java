package com.zs.pms.vo;

public class QueryChannel extends QueryPage  {
	private String cname;
	private String mohucname;
	public String getMohucname() {
		return mohucname;
	}
	public void setMohucname(String mohucname) {
		this.mohucname = mohucname;
	}
	private int pid;
	private int lev;
	private int isleaf;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIsleaf() {
		return isleaf;
	}
	public void setIsleaf(int isleaf) {
		this.isleaf = isleaf;
	}
	
	
}
