package com.zs.pms.po;

import java.io.Serializable;

public class TRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1962827445200282876L;

	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
