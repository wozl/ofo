package com.cn.ofo.bean;

/**
 * 
 * 用户类
 * **/
public class User {
	
	private Integer id;
	private String username;
	private String password;
	private Integer isadmin;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(Integer isadmin) {
		this.isadmin = isadmin;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", isadmin=" + isadmin + "]";
	}
	public User(Integer id, String username, String password, Integer isadmin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.isadmin = isadmin;
	}
	public User() {
		super();
	}
	

}
