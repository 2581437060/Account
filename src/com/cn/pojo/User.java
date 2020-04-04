package com.cn.pojo;

import java.util.List;

public class User {
	private Integer id;//��ԱID
	private String name;//��Ա����	
	private String pwd;//��Ա����
	private String account;//��Ա��¼��
	private String tel;//��Ա�绰
	private String address;//��Ա��ַ
	private Integer age;//��Ա����
	private Integer sex;//��Ա�Ա�
	private Integer uclass;//��Ա��ѡ�γ�
	private Integer uteach;//��Ա��ѡ����
	private List<Teach> teachs;
	private List<Course> courses;

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPwd() {
	return pwd;
}

public Integer getAge() {
	return age;
}
public void setAge(Integer age) {
	this.age = age;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Integer getSex() {
	return sex;
}
public void setSex(Integer sex) {
	this.sex = sex;
}
public Integer getUclass() {
	return uclass;
}
public void setUclass(Integer uclass) {
	this.uclass = uclass;
}
public Integer getUteach() {
	return uteach;
}
public void setUteach(Integer uteach) {
	this.uteach = uteach;
}
public List<Teach> getTeachs() {
	return teachs;
}
public void setTeachs(List<Teach> teachs) {
	this.teachs = teachs;
}
public List<Course> getCourses() {
	return courses;
}
public void setCourses(List<Course> courses) {
	this.courses = courses;
}
@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", account=" + account + ", tel=" + tel + ", address="
			+ address + ", age=" + age + ", sex=" + sex + ", uclass=" + uclass + ", uteach=" + uteach + ", teachs="
			+ teachs + ", courses=" + courses + "]";
}
}
