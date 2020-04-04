package com.cn.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.cn.pojo.User;
import com.cn.service.IUserService;

@Controller  
@RequestMapping("/user")  
public class UserController {
	@Resource  
    private IUserService userService;  
     /*会员登录*/
	@ResponseBody
    @RequestMapping("/login")  
    public String toIndex(User user,HttpSession session){  
		String account=user.getAccount();
		user=userService.userLogin(user.getAccount(),user.getPwd());
		if(user!=null){
			List<Map<String,Object>> list = userService.findUserByAccount(account);
			session.setAttribute("userInfo", JSON.toJSON(list));
			session.setAttribute("account", account);
			return "true";
		}
		else{
			return "false";
		}
    }
	/*转到用户信息界面*/
    @RequestMapping("/Forward")  
    public String loginForward(){  
		return "user/index";
    }
    /*退出*/
    @RequestMapping("/exit")  
    public String exit(HttpSession session){  
    	session.invalidate();
    	return "login";
    }  
    @RequestMapping("/myInfo")  
    public String myInfo(HttpSession session){  
    	String account=(String) session.getAttribute("account");
    	List<Map<String,Object>> list = userService.findUserByAccount(account);
		session.setAttribute("userInfo", JSON.toJSON(list));
    	return "user/index";
    }
    /*选课列表*/
    @RequestMapping("/classTable")  
    public String classTable(HttpSession session){  
    	List<Map<String,Object>> list = userService.findClass();
		session.setAttribute("classInfo", JSON.toJSON(list));
    	return "user/classTable";
    }
    /*教练列表*/
    @RequestMapping("/teachList")  
    public String teachList(HttpSession session){  
    	return "user/teachList";
    }
    /*教练*/
    @ResponseBody
    @RequestMapping("/selectTeach")  
    public String selectTeach(HttpSession session,Integer id){  
    	List<Map<String,Object>> list = userService.findSeTeach(id);
		session.setAttribute("SelectTeachInfo", JSON.toJSON(list));
		return "true";
    }
    /*选课，选教练*/
    @ResponseBody
    @RequestMapping("/chooseTeach")  
    public String chooseTeach(Integer id,Integer cid,Integer uid){  
    	userService.chooseTeach(id,cid,uid);
    	return "true";
    }
    /*修改信息*/
    @ResponseBody
    @RequestMapping("/updateUserInfo")  
    public String updateUserInfo(Integer id,String account,Integer sex,Integer age,String name,String pwd,String tel,String address){  
    	userService.updateUserInfo(id,account,sex,age,name,pwd,tel,address);
    	return "true";
    }  
}
