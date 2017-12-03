package com.cn.ofo.dao;

import java.util.List;

import com.cn.ofo.bean.Province;

public interface ProvinceDao {
	//查询所有的省份
	List<Province> selectAll();
}
