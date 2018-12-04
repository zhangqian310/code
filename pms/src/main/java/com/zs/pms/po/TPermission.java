package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TPermission implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7512049132416900243L;

	private int id;
    private String pname;
    private int pid;
    private int lev;
    private int isleaf;
    private int sort;
    private String url;
    private String icon;
    
    //有pid这种上下级关系 可以建立下级的集合
    private List<TPermission> child=new ArrayList<>();//子权限集
    
	public List<TPermission> getChild() {
		return child;
	}
	public void setChild(List<TPermission> child) {
		this.child = child;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
    
	
}
