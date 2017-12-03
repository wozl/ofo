package com.cn.ofo.bean;

/***
 * 省份类
 * **/
public class Province {
	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Province [id=" + id + ", name=" + name + "]";
	}
	public Province(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Province() {
		super();
	}
	

}
