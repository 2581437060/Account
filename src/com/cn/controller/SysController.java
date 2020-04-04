package com.cn.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.cn.pojo.Admin;
import com.cn.pojo.Course;
import com.cn.pojo.Teach;
import com.cn.pojo.User;
import com.cn.service.IUserService;

@Controller  
@RequestMapping("/sys")  
public class SysController {
	@Resource  
    private IUserService userService;  
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //����Ա��¼  
	@ResponseBody
    @RequestMapping("/loginAdmin")  
    public String toIndex(Admin	admin,HttpSession session){  
		admin=userService.adminLogin(admin.getName(),admin.getPwd());
		if(admin!=null){
			session.setAttribute("lastLoginTime", admin.getLastlogintime());
			session.setAttribute("account", "123");
			userService.setTime(df.format(new Date()));
			return "true";  
		}else{
			return "false";  
        }
    }  
	//��Ϣ����
	@RequestMapping("/ForwardAdmin")  
	public String loginForward(HttpSession session){  
		List<Map<String, Object>> countUserList=userService.countUser();
		session.setAttribute("countUser",countUserList);
		List<Map<String, Object>> countTeachList=userService.countTeach();
		session.setAttribute("countTeach",countTeachList);
		List<Map<String, Object>> countApparatusList=userService.countApparatus();
		session.setAttribute("countApparatus",countApparatusList);
		return "sys/main";  
	}  
	//��Ա��Ϣ
	@RequestMapping("/userTable")  
	public String userTable(HttpSession session){  
		List<Map<String, Object>> findUserList=userService.findUser();
		session.setAttribute("findUserList",findUserList);
		return "sys/userTable";  
	}  
	//������Ϣ
	@RequestMapping("/teachTable")  
	public String teachTable(HttpSession session){  
		List<Map<String, Object>> findUserList=userService.teachTable();
		
		session.setAttribute("findTeachList",findUserList);
		return "sys/teachTable";  
	}
	//�γ���Ϣ
	@RequestMapping("courseTable")
	public String courseTable(HttpSession session){
		List<Map<String, Object>> findcourse=userService.findClass();
		session.setAttribute("findcourse", findcourse);
	return "sys/courseTable";
		
	}
	//������Ϣ
	@RequestMapping("/apparatusTable")  
	public String apparatusTable(HttpSession session){  
		List<Map<String, Object>> findUserList=userService.apparatusTable();
		
		session.setAttribute("findApparatusList",findUserList);
		return "sys/apparatusTable";  
	}  
	//�˳�
    @RequestMapping("/exit")  
    public String exit(HttpSession session){  
    	session.invalidate();
    	return "login";
    } 
    //�Ա����
    @ResponseBody
    @RequestMapping("/getSex")  
    public List<User> getSex(){  
    	List<User> list=userService.getSex();
    	return list;  
    }   
    //��Աɾ��
    @ResponseBody
    @RequestMapping("/delUser")  
    public String delUser(Integer id){  
    	userService.delUser(id);
    	return "true";  
    }   
    //����ɾ��
    @ResponseBody
    @RequestMapping("/delTeach")  
    public String delTeach(Integer id){  
    	userService.delTeach(id);
    	return "true";  
    }   
    //����ɾ��
    @ResponseBody
    @RequestMapping("/delApp")  
    public String delApp(Integer id){  
    	userService.delApp(id);
    	return "true";  
    }   
    //�γ�ɾ��
    @ResponseBody
    @RequestMapping("/delCourse")  
    public String delCourse(Integer id){  
    	userService.delCourse(id);
    	return "true";  
    }  
    //ת����Ա�޸�ҳ��
    @RequestMapping("/upUser")  
    public String upUser(Integer id,String account,Integer sex,Integer age,String name,String pwd,String tel,String address,HttpSession session){  
    	
    	List list=new ArrayList();
    	list.add(id);
    	list.add(account);
    	list.add(sex);
    	list.add(age);
    	list.add(name);
    	list.add(pwd);
    	list.add(tel);
    	list.add(address);
    	session.setAttribute("upList", list);
    	return "sys/upUser";  
    }   
  //ת�������޸�ҳ��
    @RequestMapping("/upTeach")  
    public String upTeach(Integer id,String tname,Integer cid,String ttel,String taddress,HttpSession session){  
    	
    	List list=new ArrayList();
    	list.add(id);
    	list.add(tname);
    	list.add(cid);
    	list.add(ttel);
    	list.add(taddress);
    	/*Teach list=new Teach();
    	list.setCid(id);
    	list.setTname(tname);
    	list.setCid(cid);
    	list.setTtel(ttel);
    	list.setTad:ress(taddress);*/
    	List<Map<String,Object>> Teatchlist = userService.findClass();
		session.setAttribute("classInfo", JSON.toJSON(Teatchlist));
    	session.setAttribute("upTeachList", list);
    	return "sys/upTeach";  
    }
  //ת�������޸�ҳ��
    @RequestMapping("/upApparatus")
    public String upApparatus(Integer id,Integer type){
    	if(type==1)
    	userService.upAppaeatus(id);
    	if(type==0)
    	userService.upAppaeatus1(id);
		return "sys/apparatusTable";
    }
  //ת���γ��޸�ҳ��
    @RequestMapping("/upCourse")
    public String upCourse(Integer id,String cname,HttpSession session){
    	List list=new ArrayList<>();
    	list.add(id);
    	list.add(cname);
    	session.setAttribute("upCourseList", list);
		return "sys/upCourse";
    	
    }
    //���ӻ�Ա
    @ResponseBody
    @RequestMapping("/registerUser")  
    public String registerUser(User user){  
    	List<User> id=userService.findAccount(user.getAccount());
    	if(id.size()!=0){
    		return "false";
    	}
    	userService.registerUser(user);
    	return "true";  
    }   
    //��Ա����ҳ��
    @RequestMapping("/addUser")  
    public String addUser(){  
    	
    	return "sys/addUser";  
    }   
    //��������ҳ��
    @RequestMapping("/addTeach")  
    public String addTeach(HttpSession session){  
    	List<Map<String,Object>> list = userService.findClass();
		session.setAttribute("classInfo", JSON.toJSON(list));
    	return "sys/addTeach";  
    }   
    /*�γ�����ҳ��*/
    @RequestMapping("addCourse")
    public String addCourse(){
    	return "sys/addCourse";  
    }
    /*��������ҳ��*/
    @RequestMapping("/addApp")  
    public String addApp(){  
    	return "sys/addApp";  
    }   
    //��Ա�޸�
    @ResponseBody
    @RequestMapping("/upUserInfo")  
    public String upUserInfo(Integer id,String account,Integer sex,Integer age,String name,String pwd,String tel,String address){  
    	userService.updateUserInfo(id,account,sex,age,name,pwd,tel,address);
    	return "true";  
    }   
  //�����޸�
    @ResponseBody
    @RequestMapping(value="/upTeachInfo",method=RequestMethod.POST)  
    public String upTeach(Integer id,String tname,Integer cid,String ttel,String taddress){  
    	userService.upTeach(id,tname,cid,ttel,taddress);
    	return "true";  
    }   
  //�γ��޸�
    @ResponseBody
    @RequestMapping(value="/upCourseInfo",method=RequestMethod.POST)  
    public String upTeach(Course course){  
    	System.out.println(course);
    	userService.upCourse(course);
    	return "true";  
    }
    //��������
    @ResponseBody
    @RequestMapping("/addTeachInfo")  
    public String addTeachInfo(Teach teach){  
    	userService.addTeachInfo(teach);
    	return "true";  
    }   
    //��������
    @ResponseBody
    @RequestMapping("/addAppInfo")  
    public String addAppInfo(String aname){  
    	userService.addAppInfo(aname);
    	return "true";  
    }
    //�γ�����
    @ResponseBody
    @RequestMapping("/addCourseInfo")  
    public String addCourseInfo(String cname){  
    	userService.addCourse(cname);
    	return "true";  
    }
    /*�û�ģ����ѯ*/
    @RequestMapping("/find1")  
    public String find1(@Param(value="name") String name,HttpSession session){
    	List<User> findUserList=userService.find1(name);
    	session.setAttribute("findUserList",findUserList);
    	return "sys/userTable";  
    }
    /*����ģ����ѯ*/
    @RequestMapping("/find2")  
    public String find2(@Param(value="name") String name,HttpSession session){
    	List<Teach> findUserList=userService.find2(name);
    	session.setAttribute("findTeachList",findUserList);
		return "sys/teachTable";   
    }
}
