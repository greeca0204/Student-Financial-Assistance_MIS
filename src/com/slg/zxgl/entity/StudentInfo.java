package com.slg.zxgl.entity;

public class StudentInfo {
	private int id;
	private String accname;
	private String name;
	private String gender = "F";
	private String politicsStatus = "ÈºÖÚ";
	private String nationality = "ºº×å";
	private String identification = "";
	private String phone = "";
	private String address = "";
	private String classname = "";
	private String gradename;
	private String collegename;
	private String majorname;

	private boolean poor = false;

	public StudentInfo() {
	}

	public StudentInfo(int id, String accname, String name, String gender, String politicsStatus, String nationality,
			String identification, String phone, String address, String classname, String gradename, String collegename,
			String majorname, boolean poor) {
		super();
		this.id = id;
		this.accname = accname;
		this.name = name;
		this.gender = gender;
		this.politicsStatus = politicsStatus;
		this.nationality = nationality;
		this.identification = identification;
		this.phone = phone;
		this.address = address;
		this.classname = classname;
		this.gradename = gradename;
		this.collegename = collegename;
		this.majorname = majorname;
		this.poor = poor;
	}

	public String getAccname() {
		return accname;
	}

	public void setAccname(String accname) {
		this.accname = accname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPoliticsStatus() {
		return politicsStatus;
	}

	public void setPoliticsStatus(String politicsStatus) {
		this.politicsStatus = politicsStatus;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
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

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getCollegename() {
		return collegename;
	}

	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}

	public String getMajorname() {
		return majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}

	public boolean isPoor() {
		return poor;
	}

	public void setPoor(boolean poor) {
		this.poor = poor;
	}

	@Override
	public String toString() {
		return "StudentInfo [id=" + id + ", accname=" + accname + ", name=" + name + ", gender=" + gender
				+ ", politicsStatus=" + politicsStatus + ", nationality=" + nationality + ", identification="
				+ identification + ", phone=" + phone + ", address=" + address + ", classname=" + classname
				+ ", gradename=" + gradename + ", collegename=" + collegename + ", majorname=" + majorname + ", poor="
				+ poor + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
