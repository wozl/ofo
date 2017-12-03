package com.cn.ofo.cntroller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.cn.ofo.bean.Bike;
import com.cn.ofo.bean.City;
import com.cn.ofo.bean.Province;
import com.cn.ofo.bean.User;
import com.cn.ofo.service.ofoService;



/**
 * 控制器类
 * ***/
@Controller
@RequestMapping("/ofo")
public class ofoConteroller {

	@Autowired
	private ofoService ofoService;
	
	
	
	@RequestMapping(value="/wel.do")
	public String wel(){
		return "Login";
	}
	
	//跳转到注册页
	@RequestMapping(value="/res.do")
	public String res(){
		return "register";
	}
	
	//跳转到查询页
	@RequestMapping(value="/sel.do")
	public String sel(){
		
		return "selectbike";
	}
	
	//跳转到添加车辆信息页
	@RequestMapping(value="/addbike.do")
	public String addbike(){
		
		return "addbike";
	}
	
	//登录处理
	@RequestMapping(value="/Login.do",method=RequestMethod.POST)
	public String Login(User user,HttpSession session,HttpServletRequest request){
		if(ofoService.Login(user)){
			if(ofoService.checkadmin(user)){
				session.setAttribute("user", user);
				return "/admin/admin";
			}
			session.setAttribute("user", user);
			return "Welcome";
		}
		return "LoginError";
	}
	
	//用户注册
	@RequestMapping(value="/regs.do",method=RequestMethod.POST)
	public String reg(User user ,HttpServletRequest request){
		//System.out.println(user.getUsername()+"\t"+user.getPassword());
		if(ofoService.name(user.getUsername())){
			
		if(ofoService.reg(user)){
			return "Login";
		}
		}
		request.setAttribute("msg", "用户名已存在");
		return "erro";
	}
	
	
	//查询省
	@RequestMapping(value="/getProvince.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Province> getProvince(){
		List<Province>listpro=ofoService.listpro();
		
		return listpro;
	}

	//查询市
	@RequestMapping(value="/getCity.do",method=RequestMethod.POST)
	@ResponseBody
	public List<City>getCity(Integer id){
		List<City>listcity=ofoService.listcity(id);
		return listcity;
	}
	
	//查询市的车辆信息
	@RequestMapping(value="/getBike.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Bike> getbike(Integer cityid){
		List<Bike>listbike=ofoService.listbike(cityid);
	
		return listbike;
	}
	
	//用户退出
	@RequestMapping(value="loginout.do")
	public String loginout(HttpSession session){
		session.invalidate();
		return "loginout";
	}
	
}
