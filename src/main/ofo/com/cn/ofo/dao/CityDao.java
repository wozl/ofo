package com.cn.ofo.dao;

import java.util.List;

import com.cn.ofo.bean.City;

public interface CityDao {
	//查询某个省份下的所有市/县
	List<City> selectAll(Integer pid);
	
	
	
}
