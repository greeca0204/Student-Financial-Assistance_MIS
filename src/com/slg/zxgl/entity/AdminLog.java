package com.slg.zxgl.entity;

import java.sql.Timestamp;

public class AdminLog {
	private int id;
	private int adminid;
	private String adminname;
	private Timestamp opttime;
	private String operation;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public Timestamp getOpttime() {
		return opttime;
	}
	public void setOpttime(Timestamp opttime) {
		this.opttime = opttime;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	@Override
	public String toString() {
		return "AdminLog [id=" + id + ", adminid=" + adminid + ", adminname=" + adminname + ", opttime=" + opttime
				+ ", operation=" + operation + "]";
	}
	public AdminLog(int adminid,String operation){
		this.opttime = new Timestamp(System.currentTimeMillis());
		this.adminid = adminid;
		this.operation = operation;
	}
	public AdminLog(int id, int adminid, String adminname, Timestamp opttime, String operation) {
		super();
		this.id = id;
		this.adminid = adminid;
		this.adminname = adminname;
		this.opttime = opttime;
		this.operation = operation;
	}
	public AdminLog() {
	}
}
