package com.cn.service;


import java.util.List;
import java.util.Map;

import com.cn.pojo.Admin;
import com.cn.pojo.Course;
import com.cn.pojo.Teach;
import com.cn.pojo.User;
 
public interface IUserService {
//会员登录
public User userLogin(String account, String pwd);
//会员信息
public List<Map<String, Object>> findUserByAccount(String account);
//课程查询
public List<Map<String, Object>> findClass();
//教练查询
public List<Map<String, Object>> findSeTeach(Integer id);
//选课
public void chooseTeach(Integer id, Integer cid,Integer uid);
//修改会员信息
public void updateUserInfo(Integer id,String account, Integer sex, Integer age, String name,
		String pwd, String tel, String address);
//管理员登录
public Admin adminLogin(String name, String pwd);
//更改登录时间
public void setTime(String format);
//统计会员人数
public List<Map<String, Object>> countUser();
//统计教练人数
public List<Map<String, Object>> countTeach();
//统计器材数
public List<Map<String, Object>> countApparatus();
//统计男，女人数
public List<User> getSex();
//会员查询
public List<Map<String, Object>> findUser();
//教练查询
public List<Map<String, Object>> teachTable();
//器材查询
public List<Map<String, Object>> apparatusTable();
//查询用户ID
public List<User> findAccount(String account);
//增加用户
public void registerUser(User user);
//删除会员
public void delUser(Integer id);
//增加教练
public void addTeachInfo(Teach teach);
//删除教练
public void delTeach(Integer id);
//修改教练
public void upTeach(Integer id,String tname, Integer cid, String ttel, String taddress);
//增加器材
public void addAppInfo(String aname);
//删除器材
public void delApp(Integer id);
//器材报修
public void upAppaeatus(Integer id);
//器材已维修
public void upAppaeatus1(Integer id);
//增加课程
public void addCourse(String cname);
//删除课程
public void delCourse(Integer id);
//修改课程
public void upCourse(Course course);
//会员模糊查询
public List<User>  find1(String name);
//教练模糊查询
public List<Teach> find2(String name);

}