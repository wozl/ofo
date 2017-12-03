package com.cn.ofo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.cn.ofo.bean.Bike;
import com.cn.ofo.bean.User;
import com.cn.ofo.dao.BikeDao;
import com.cn.ofo.dao.CityDao;
import com.cn.ofo.dao.ProvinceDao;
import com.cn.ofo.dao.UserDao;

@Service
public class ofoAdminService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProvinceDao provinceDao;

	@Autowired
	private CityDao cityDao;

	@Autowired
	private BikeDao bikeDao;
	
	//查询所有用户信息
	public List<User>listuser(){
		
		return userDao.selectAll();
	}
	
	//添加车辆信息
	/*@SuppressWarnings({ "unused", "finally" })
	@Transactional*/
	public boolean addbikes(Bike bike){
		System.out.println(bike.getId()+"\t"+bike.getBikeno()+"\t"+bike.getPassword()+"\t"+bike.getCityid());
			if(bikeDao.addbike(bike)>0){
				return true;
		}else{
			return false;
		}
		
		/*	if(bike!=null){
					try {
							bikeDao.addbike(bike);
					} catch (Exception e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}finally {
						return false;
					}
				}else{
					return true;
				}*/
	}
	
	//按名字查询用户
	public User finduser(String name){
		return userDao.selectByName(name);
	}
	
	//统计系统用户数量
	public int countUser(){
		return userDao.countUser();
	}
	
	//更新用户信息
	public int updateuser(User user){
		System.out.println(user.getUsername()+"\t"+user.getPassword());
		return userDao.updateuser(user);
	}
	
	//删除用户
	public int deleteuser(Integer id){
		return userDao.deleteuser(id);
	}
	
}
