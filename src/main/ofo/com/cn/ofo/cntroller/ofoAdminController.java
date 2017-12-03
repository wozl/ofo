package com.cn.ofo.cntroller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.ofo.bean.Bike;
import com.cn.ofo.bean.User;
import com.cn.ofo.service.ofoAdminService;

@Controller
@RequestMapping("/admin")
public class ofoAdminController {

	@Autowired
	private ofoAdminService ofoAdminService;
	
	//跳转到所有用户页面  查询所有用户
	@RequestMapping(value="/alluser.do")
	public String users(HttpServletRequest request){
		List<User>listuser=ofoAdminService.listuser();
		request.setAttribute("users", listuser);
		return "/admin/alluser";
	}
	
	//跳转到添加车辆页面
	@RequestMapping(value="/addbike.do")
	public String addbike(){
		
		return "/admin/addbike";
	}
	
	//添加车辆信息
	@RequestMapping(value="/addbikes.do")
	@ResponseBody
	public boolean addbikes(@Param("id")Integer id,@Param("bikeno")Integer bikeno,
			@Param("password")Integer password,@Param("cityid")Integer cityid){
		Bike bike=new Bike();
		bike.setId(id);
		bike.setBikeno(bikeno);
		bike.setPassword(password);
		bike.setCityid(cityid);
		boolean a=ofoAdminService.addbikes(bike);
		return a;
	}
	
	//跳转到搜索用户页面
	@RequestMapping(value="/find.do")
	public String find(){
		
		return "/admin/finduser";
	}

	//跳转到服务器信息页面
	@RequestMapping(value="/service.do")
	public String service(HttpServletRequest request){
		int count=ofoAdminService.countUser();
		request.setAttribute("count", count);
		return "/admin/service";
	}
	
	//按名字查询用户
	@RequestMapping(value="/finduser.do")
	@ResponseBody
	public List<User> finduser(@Param("name")String name){
		User user=ofoAdminService.finduser(name);
		List<User>lists=new ArrayList<User>();
		lists.add(user);
		return lists;
	}
	
	//更新用户
	@RequestMapping(value="/updateuser.do",method=RequestMethod.POST)
	@ResponseBody
	public int updateuser(@Param("id")Integer id,@Param("newname")String newname,@Param("newpassword")String newpassword){
		User user=new User();
		user.setId(id);
		user.setUsername(newname);
		user.setPassword(newpassword);
		
		return ofoAdminService.updateuser(user);
	}
	
	//删除用户
	@RequestMapping(value="/deleteuser.do",method=RequestMethod.POST)
	@ResponseBody
	public int deleteuser(Integer id){
		
		return ofoAdminService.deleteuser(id);
	}
	
}
