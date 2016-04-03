package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.AdminLog;

public interface AdminLogDao {
	public List<AdminLog> getLogsByWord(String word);
	public void addLog(AdminLog log); 
}
