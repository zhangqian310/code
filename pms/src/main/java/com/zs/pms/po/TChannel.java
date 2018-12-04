package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TChannel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2017797701798209722L;

	
	private int id;
    private String cname;
    
    //private int  pid;
    private TChannel pChannel;//上级栏目
    
    private List<TChannel> child;//下级栏目
    
    private List<TArticle> articles;//栏目下的文章
    
    private int lev;
    private int isleaf;
    private String isleafTxt;
    public String getIsleafTxt() {
    	if (isleaf==1) {
			return "是";
		}
		return "否";
	}
	private int sort;
    private int  creator;
    private Date creatime;
    private int  updator;
    private Date updatime;
    
    
	public List<TArticle> getArticles() {
		return articles;
	}
	public void setArticles(List<TArticle> articles) {
		this.articles = articles;
	}
	public List<TChannel> getChild() {
		return child;
	}
	public void setChild(List<TChannel> child) {
		this.child = child;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public TChannel getpChannel() {
		return pChannel;
	}
	public void setpChannel(TChannel pChannel) {
		this.pChannel = pChannel;
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
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatime() {
		return updatime;
	}
	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}
    
    
}
