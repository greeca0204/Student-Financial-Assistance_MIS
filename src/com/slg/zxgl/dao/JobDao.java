package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.ScholarShip;

public interface JobDao {
	public List<Job> getAllJobs();
	public String getJobNameById(int id);
	public Job getJobById(int id);
	public List<Job> getJobsByWord(String word);
	public List<ScholarShip> getScholarShipByWord(String word);
	public List<GrantShip> getGrantShipByWord(String word);
	public boolean updateJob(Job job);
	public boolean addJob(Job job);
	public boolean deleteJob(int jobid);
}
