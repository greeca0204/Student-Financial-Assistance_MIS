package com.slg.zxgl.entity;

public class Teacher extends User {
	private int classId = 0;
	private String className = "不是班主任";
	private String department ;
	private String position;
	private String positiontitle;
	private String phone;
	private String email;
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPositiontitle() {
		return positiontitle;
	}
	public void setPositiontitle(String positiontitle) {
		this.positiontitle = positiontitle;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Teacher(int id, String accname, String password, int userType, String name, int classId, String className,String department,
			String position, String positiontitle, String phone, String email) {
		super(id, accname, password, userType, name);
		this.classId = classId;
		this.className = className;
		this.department = department;
		this.position = position;
		this.positiontitle = positiontitle;
		this.phone = phone;
		this.email = email;
	}
	public Teacher() {
		super();
	}
	public String getClassName() {
		if(className!=null){
			return className;
		}else{
			return "没有带的班级";
		}
	}
	public void setClassName(String className) {
		this.className = className;
	}
}
