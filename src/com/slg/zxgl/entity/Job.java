package com.slg.zxgl.entity;

import java.sql.Timestamp;

public class Job {
	private int id;
	private String name;
	private int allNumber;
	private String worktime;
	private String workpoint;
	private String skills;
	private String interview;
	private Timestamp addTime;
	private String emplyer;
	private boolean activition;
	public Job() {
	}
	public Job(int id, String name, int allNumber, String worktime, String workpoint, String skills, String interview,
			Timestamp addTime, String emplyer, boolean activition) {
		super();
		this.id = id;
		this.name = name;
		this.allNumber = allNumber;
		this.worktime = worktime;
		this.workpoint = workpoint;
		this.skills = skills;
		this.interview = interview;
		this.addTime = addTime;
		this.emplyer = emplyer;
		this.activition = activition;
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
	public int getAllNumber() {
		return allNumber;
	}
	public void setAllNumber(int allNumber) {
		this.allNumber = allNumber;
	}
	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	public String getWorkpoint() {
		return workpoint;
	}
	public void setWorkpoint(String workpoint) {
		this.workpoint = workpoint;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getInterview() {
		return interview;
	}
	public void setInterview(String interview) {
		this.interview = interview;
	}
	public Timestamp getAddTime() {
		return addTime;
	}
	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}
	public String getEmplyer() {
		return emplyer;
	}
	public void setEmplyer(String emplyer) {
		this.emplyer = emplyer;
	}
	
	public boolean isActivition() {
		return activition;
	}
	public void setActivition(boolean activition) {
		this.activition = activition;
	}
	@Override
	public String toString() {
		return "Job [id=" + id + ", name=" + name + ", allNumber=" + allNumber + ", worktime=" + worktime
				+ ", workpoint=" + workpoint + ", skills=" + skills + ", interview=" + interview + ", addTime="
				+ addTime + ", emplyer=" + emplyer + ", activition=" + activition + "]";
	}
	
}
