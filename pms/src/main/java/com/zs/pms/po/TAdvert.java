package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

import com.zs.pms.util.DateUtil;

public class TAdvert implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4829488509905504114L;

	private int id;
    private String title;
    private String content;
    private int creator;
    private TUser user;
    private Date creatime;
    private String creatimeTxt;
    private int  updator;
    private Date updatime;
    
	public String getCreatimeTxt() {
		if (creatime!=null) {
			return DateUtil.getDateToStr(creatime, "yyyy-MM-dd");
		}
		return creatimeTxt;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
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
