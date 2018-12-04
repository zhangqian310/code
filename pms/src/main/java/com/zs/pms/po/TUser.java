package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.util.DateUtil;



public class TUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5293214558214995122L;

	private int id;
    private String loginname;
    private String password;
    private String sex;
    private Date birthday;
    private String email;
    
    private TDep dept;//关联对象 一对一
    
    private String relname;
    private int  creator;
    private Date creatime;
    private int updator;
    private Date  updatime;
    private String pic;
    private int isenabled;
    private String isenabledTxt;
    private String birthdayTxt;
    
    public String getBirthdayTxt() {
    	if (birthday!=null) {
			return DateUtil.getDateToStr(birthday, "yyyy-MM-dd");
		}
		return birthdayTxt;
	}



	public String getIsenabledTxt() {
    	if (isenabled==1) {
    		return "是";
		} else {
			return "否";
		}
		
	}
	private List<TPermission> permissions;//关联权限列表
    
    //左侧菜单 由 permissions整理出来
    private List<TPermission> menu=new ArrayList<>();
    //${user.menu }  就是调用getMenu()方法                 
	public List<TPermission> getMenu() {
		//清空   否则只能get一次 多次值会重复
		menu.clear();
		//遍历permissions
		for (TPermission per1 : permissions) {
			//一级菜单
			if (per1.getPid()==0) {
				//清空
				per1.getChild().clear();
				//装载一级菜单下的二级菜单
				for (TPermission per2 : permissions) {
					//一级菜单的id == 二级菜单的pid
					//说明该权限是一级菜单的子菜单
					if (per1.getId()==per2.getPid()) {
						//   set get
						per1.getChild().add(per2);
					}
				}
				//装载好的一级菜单放入菜单
				menu.add(per1);
			}
		}
		//返回整理好的菜单
		return menu;
	}
	
	
	
	public List<TPermission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<TPermission> permissions) {
		this.permissions = permissions;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public TDep getDept() {
		return dept;
	}
	public void setDept(TDep dept) {
		this.dept = dept;
	}
	public String getRelname() {
		return relname;
	}
	public void setRelname(String relname) {
		this.relname = relname;
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
    
	
}
