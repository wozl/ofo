package com.cn.ofo.dao;




import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cn.ofo.bean.User;

/***
 * 查询数据库用户信息
 * **/
public interface UserDao {
	
	List<User> selectAll();
	
	User selectByName(String username);
	
	User selectById(Integer id);

	@Select("SELECT COUNT(1) FROM `users`;")
    int countUser();
	
	int adduser(User user);
	
	int updateuser(User user);
	
	int deleteuser(Integer id);
	
}
