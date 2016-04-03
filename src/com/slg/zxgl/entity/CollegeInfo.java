package com.slg.zxgl.entity;

public class CollegeInfo {
	private int id;
	private String name;
	private String shortname;
	private String description;
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
	public String getShortname() {
		return shortname;
	}
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public CollegeInfo(int id, String name, String shortname, String description) {
		super();
		this.id = id;
		this.name = name;
		this.shortname = shortname;
		this.description = description;
	}
	public CollegeInfo() {
		super();
	}
}
