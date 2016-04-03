package com.slg.zxgl.entity;

public class ClassInfo {
	private int id;
	private String name;
	private String shortname;
	private String description;
	private int gradeid;
	private String gradename;
	private int collegeid;
	private String collegename;
	private int majorid;
	private String majorname;
	public ClassInfo() {
		super();
	}
	
	public ClassInfo(int id, String name, String shortname, String description, int gradeid, String gradename,
			int collegeid, String collegename, int majorid, String majorname) {
		super();
		this.id = id;
		this.name = name;
		this.shortname = shortname;
		this.description = description;
		this.gradeid = gradeid;
		this.gradename = gradename;
		this.collegeid = collegeid;
		this.collegename = collegename;
		this.majorid = majorid;
		this.majorname = majorname;
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
	public int getGradeid() {
		return gradeid;
	}
	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public int getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(int collegeid) {
		this.collegeid = collegeid;
	}
	public String getCollegename() {
		return collegename;
	}
	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}
	public int getMajorid() {
		return majorid;
	}
	public void setMajorid(int majorid) {
		this.majorid = majorid;
	}
	public String getMajorname() {
		return majorname;
	}
	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}
	@Override
	public String toString() {
		return "ClassInfo [id=" + id + ", name=" + name + ", shortname=" + shortname + ", description=" + description
				+ ", gradeid=" + gradeid + ", gradename=" + gradename + ", collegeid=" + collegeid + ", collegename="
				+ collegename + ", majorid=" + majorid + ", majorname=" + majorname + "]";
	}
	
}
