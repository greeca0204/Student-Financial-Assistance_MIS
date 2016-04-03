package com.slg.zxgl.entity;

import java.sql.Timestamp;

public class ScholarShip {
	private int id;
	private String name;
	private double money;
	private String request;
	private String number;
	private Timestamp addtime;
	private String stype;
	private boolean activition;
	public ScholarShip() {
	}
	public ScholarShip(int id, String name, double money, String request, String number, Timestamp addtime,
			String stype, boolean activition) {
		super();
		this.id = id;
		this.name = name;
		this.money = money;
		this.request = request;
		this.number = number;
		this.addtime = addtime;
		this.stype = stype;
		this.setActivition(activition);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Timestamp getAddtime() {
		return addtime;
	}
	public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public boolean isActivition() {
		return activition;
	}
	public void setActivition(boolean activition) {
		this.activition = activition;
	}
	@Override
	public String toString() {
		return "ScholarShip [id=" + id + ", name=" + name + ", money=" + money + ", request=" + request + ", number="
				+ number + ", addtime=" + addtime + ", stype=" + stype + ", activition=" + activition + "]";
	}
	
}
