package com.zs.pms.vo;

/**用户查询对象
 * @author Administrator
 *
 */
public class QueryUser extends QueryPage {
	private String loginname;
	private String password;
	private int isenabled;
	private String sex;
	private String chkcode;//验证码
	private String rem;//是否记住密码
	private String mohuname;//模糊查询名
	private String mohuenabled;//模糊查询是否可用
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMohuname() {
		return mohuname;
	}
	public void setMohuname(String mohuname) {
		this.mohuname = mohuname;
	}
	public String getMohuenabled() {
		return mohuenabled;
	}
	public void setMohuenabled(String mohuenabled) {
		this.mohuenabled = mohuenabled;
	}
	public String getRem() {
		return rem;
	}
	public void setRem(String rem) {
		this.rem = rem;
	}
	public String getChkcode() {
		return chkcode;
	}
	public void setChkcode(String chkcode) {
		this.chkcode = chkcode;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
