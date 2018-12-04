package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

import com.zs.pms.util.DateUtil;

public class TArticle implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 379814413321609472L;

	private int id;
    private String title;
    private String content;
    private String author;
    private Date crtime;
    private String crtimeTxt;
    
    public String getCrtimeTxt() {
    	if (crtime!=null) {
			return DateUtil.getDateToStr(creatime, "yyyy-MM-dd");
		}
		return crtimeTxt;
	}
	//private int channel;
    private TChannel channel;//关联
    
    private int isremod;
    private int ishot;
    private String remod;
    private String hot;
    public String getRemod() {
    	if (isremod==1) {
			return "是";
		}else{
			return "否";
		}
	}
	public String getHot() {
		if (ishot==1) {
			return "是";
		}else{
			return "否";
		}
	}
	private int  creator;
    private Date creatime;
    private int updator;
    private Date updatime;
    
	public TChannel getChannel() {
		return channel;
	}
	public void setChannel(TChannel channel) {
		this.channel = channel;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCrtime() {
		return crtime;
	}
	public void setCrtime(Date crtime) {
		this.crtime = crtime;
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
