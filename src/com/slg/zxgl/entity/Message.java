package com.slg.zxgl.entity;

import java.sql.Timestamp;

public class Message {
	private int id;
	private String title;
	private String details;
	private Timestamp addtime;
	
	public Message() {
	}
	public Message(int id, String title, String details, Timestamp addtime) {
		super();
		this.id = id;
		this.title = title;
		this.details = details;
		this.addtime = addtime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Timestamp getAddtime() {
		return addtime;
	}
	public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}
}
