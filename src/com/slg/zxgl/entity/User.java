package com.slg.zxgl.entity;

public class User {
	private int id;
	private String accname;
	private String password;
	private int userType;
	private String name;

	public User() {
	}

	public User(int id, String accname, String password, int userType, String name) {
		super();
		this.id = id;
		this.accname = accname;
		this.password = password;
		this.userType = userType;
		this.name = name;
	}

	public String getaccname() {
		return accname;
	}

	public void setaccname(String accname) {
		this.accname = accname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", accname=" + accname + ", password=" + password + ", userType=" + userType
				+ ", name=" + name + "]";
	}

	
}