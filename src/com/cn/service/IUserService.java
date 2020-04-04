package com.cn.service;


import java.util.List;
import java.util.Map;

import com.cn.pojo.Admin;
import com.cn.pojo.Course;
import com.cn.pojo.Teach;
import com.cn.pojo.User;
 
public interface IUserService {
//��Ա��¼
public User userLogin(String account, String pwd);
//��Ա��Ϣ
public List<Map<String, Object>> findUserByAccount(String account);
//�γ̲�ѯ
public List<Map<String, Object>> findClass();
//������ѯ
public List<Map<String, Object>> findSeTeach(Integer id);
//ѡ��
public void chooseTeach(Integer id, Integer cid,Integer uid);
//�޸Ļ�Ա��Ϣ
public void updateUserInfo(Integer id,String account, Integer sex, Integer age, String name,
		String pwd, String tel, String address);
//����Ա��¼
public Admin adminLogin(String name, String pwd);
//���ĵ�¼ʱ��
public void setTime(String format);
//ͳ�ƻ�Ա����
public List<Map<String, Object>> countUser();
//ͳ�ƽ�������
public List<Map<String, Object>> countTeach();
//ͳ��������
public List<Map<String, Object>> countApparatus();
//ͳ���У�Ů����
public List<User> getSex();
//��Ա��ѯ
public List<Map<String, Object>> findUser();
//������ѯ
public List<Map<String, Object>> teachTable();
//���Ĳ�ѯ
public List<Map<String, Object>> apparatusTable();
//��ѯ�û�ID
public List<User> findAccount(String account);
//�����û�
public void registerUser(User user);
//ɾ����Ա
public void delUser(Integer id);
//���ӽ���
public void addTeachInfo(Teach teach);
//ɾ������
public void delTeach(Integer id);
//�޸Ľ���
public void upTeach(Integer id,String tname, Integer cid, String ttel, String taddress);
//��������
public void addAppInfo(String aname);
//ɾ������
public void delApp(Integer id);
//���ı���
public void upAppaeatus(Integer id);
//������ά��
public void upAppaeatus1(Integer id);
//���ӿγ�
public void addCourse(String cname);
//ɾ���γ�
public void delCourse(Integer id);
//�޸Ŀγ�
public void upCourse(Course course);
//��Աģ����ѯ
public List<User>  find1(String name);
//����ģ����ѯ
public List<Teach> find2(String name);

}