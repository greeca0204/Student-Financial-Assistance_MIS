package com.slg.zxgl.entity;

public class Poorinfo {
	private int id = 0;
	private int stuid = 0;
	private int homepeople = 0;
	private double homeincome = 0;
	private int poorgrade = 0;
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
	public int getHomepeople() {
		return homepeople;
	}
	public void setHomepeople(int homepeople) {
		this.homepeople = homepeople;
	}
	public double getHomeincome() {
		return homeincome;
	}
	public void setHomeincome(double homeincome) {
		this.homeincome = homeincome;
	}
	public Poorinfo(int id, int stuid, int homepeople, double homeincome, int poorgrade) {
		super();
		this.id = id;
		this.stuid = stuid;
		this.homepeople = homepeople;
		this.homeincome = homeincome;
		this.poorgrade = poorgrade;
	}
	public Poorinfo() {
	}
	public int getPoorgrade() {
		return poorgrade;
	}
	public void setPoorgrade(int poorgrade) {
		this.poorgrade = poorgrade;
	}
}
