package com.slg.zxgl.entity;

public class ApplicationInfo {
	private int id;
	private String name;
	private int stuid;
	private int requestid;
	private int check;
	private int type;

	public ApplicationInfo(int id, String name, int stuid, int requestid, int check, int type) {
		super();
		this.id = id;
		this.name = name;
		this.stuid = stuid;
		this.requestid = requestid;
		this.check = check;
		this.type = type;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public int getRequestid() {
		return requestid;
	}
	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	
	@Override
	public String toString() {
		return "ApplicationInfo [id=" + id + ", name=" + name + ", stuid=" + stuid + ", requestid=" + requestid
				+ ", check=" + check + ", type=" + type + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
