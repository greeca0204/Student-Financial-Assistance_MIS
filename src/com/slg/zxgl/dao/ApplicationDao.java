package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.ApplicationInfo;
import com.slg.zxgl.entity.GrantShipApplication;
import com.slg.zxgl.entity.JobApplication;

public interface ApplicationDao {
	public List<ApplicationInfo> getScholarShips(int stuid);
	public List<ApplicationInfo> getGrantShips(int stuid);
	public List<ApplicationInfo> getJobs(int stuid);
	public boolean addApplication(int requestid, int stuid, int type);
	public List<ApplicationInfo> getApplicationsByType(int type);
	public boolean updateApplication(int id, int check);
	public List<GrantShipApplication> getGrantShipApplication(String word);
	public List<JobApplication> getJobApplication(String word);
}
