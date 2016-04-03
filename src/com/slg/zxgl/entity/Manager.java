package com.slg.zxgl.entity;

public class Manager extends User {
	private int permssion;

	public Manager() {
	}
	
	public int getPermssion() {
		return permssion;
	}

	public void setPermssion(int permssion) {
		this.permssion = permssion;
	}

	public Manager(int id, String accname, String password, int userType, String name, int permssion) {
		super(id, accname, password, userType, name);
		this.permssion = permssion;
	}
	
	
}
