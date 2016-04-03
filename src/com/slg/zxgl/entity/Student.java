package com.slg.zxgl.entity;

public class Student extends User {
	private String gender = "F";
	private int classId = 0;
	private String politicsStatus = "ÈºÖÚ";
	private String nationlity = "ºº×å";
	private String identification = "";
	private String phone = "";
	private String address = "";
	private String classname = "";
	private boolean poor = false;

	public Student() {
	}

	public Student(int id, String accname, String password, int userType, String name, String gender,
			String politicsStatus, String nationlity, String identification, String phone, String address, int classId,
			String classname, boolean poor) {
		super(id, accname, password, userType, name);
		this.gender = gender;
		this.classId = classId;
		this.politicsStatus = politicsStatus;
		this.nationlity = nationlity;
		this.identification = identification;
		this.phone = phone;
		this.address = address;
		this.classname = classname;
		this.poor = poor;
	}



	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getPoliticsStatus() {
		return politicsStatus;
	}

	public void setPoliticsStatus(String politicsStatus) {
		this.politicsStatus = politicsStatus;
	}

	public String getNationlity() {
		return nationlity;
	}

	public void setNationlity(String nationlity) {
		this.nationlity = nationlity;
	}

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public boolean isPoor() {
		return poor;
	}

	public void setPoor(boolean poor) {
		this.poor = poor;
	}

	@Override
	public String toString() {
		return "Student [gender=" + gender + ", classId=" + classId + ", politicsStatus=" + politicsStatus
				+ ", nationlity=" + nationlity + ", identification=" + identification + ", phone=" + phone
				+ ", address=" + address + ", classname=" + classname + ", poor=" + poor + "]";
	}
	
}
