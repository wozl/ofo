package com.cn.ofo.dao;

import java.util.List;

import com.cn.ofo.bean.Bike;

public interface BikeDao {

	//查询这个市/县下的所车辆信息
	List<Bike> selectAll(Integer cityid);
	
	//通过车牌号查询密码
	Bike selectByNo(Integer bikeno);
	
	int  addbike(Bike bike);
	
}
