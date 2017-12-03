package com.cn.ofo.bean;

/***
 * 自行车类
 * ***/

public class Bike {

		private Integer id;
		private Integer bikeno;
		private Integer password;
		private Integer cityid;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getBikeno() {
			return bikeno;
		}
		public void setBikeno(Integer bikeno) {
			this.bikeno = bikeno;
		}
		public Integer getPassword() {
			return password;
		}
		public void setPassword(Integer password) {
			this.password = password;
		}
		public Integer getCityid() {
			return cityid;
		}
		public void setCityid(Integer cityid) {
			this.cityid = cityid;
		}
		@Override
		public String toString() {
			return "Bike [id=" + id + ", bikeno=" + bikeno + ", password=" + password + ", cityid=" + cityid + "]";
		}
		public Bike(Integer id, Integer bikeno, Integer password, Integer cityid) {
			super();
			this.id = id;
			this.bikeno = bikeno;
			this.password = password;
			this.cityid = cityid;
		}
		public Bike() {
			super();
		}
		
	
}
