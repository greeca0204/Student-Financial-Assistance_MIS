package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.JobDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.ScholarShip;

public class JobDaoImpl implements JobDao {

	private final static String TABLE_NAME = "tb_job";

	@Override
	public List<Job> getAllJobs() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM TABLE_NAME";
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Job> list = new ArrayList<Job>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				int allNumber = res.getInt("allnumber");
				String worktime = res.getString("worktime");
				String workpoint = res.getString("workpoint");
				String skills = res.getString("skills");
				String interview = res.getString("interview");
				Timestamp addTime = res.getTimestamp("addtime");
				String emplyer = res.getString("employer");
				boolean activition = res.getBoolean("activition");
				Job job = new Job(id, name, allNumber, worktime, workpoint, skills, interview, addTime, emplyer,
						activition);
				list.add(job);
			}
			if (list.size() == 0) {
				return null;
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getJobNameById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT name FROM TABLE_NAME WHERE id=" + id;
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			while (res.next()) {
				String name = res.getString(1);
				return name;
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Job getJobById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM TABLE_NAME WHERE id=" + id;
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			while (res.next()) {
				String name = res.getString("name");
				int allNumber = res.getInt("allnumber");
				String worktime = res.getString("worktime");
				String workpoint = res.getString("workpoint");
				String skills = res.getString("skills");
				String interview = res.getString("interview");
				Timestamp addTime = res.getTimestamp("addtime");
				String emplyer = res.getString("employer");
				boolean activition = res.getBoolean("activition");
				return new Job(id, name, allNumber, worktime, workpoint, skills, interview, addTime, emplyer,
						activition);
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Job> getJobsByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM tb_job WHERE NAME LIKE '%" + word + "%' OR skills LIKE '%" + word
				+ "%' OR employer LIKE '%" + word + "%'";
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Job> list = new ArrayList<Job>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				int allNumber = res.getInt("allnumber");
				String worktime = res.getString("worktime");
				String workpoint = res.getString("workpoint");
				String skills = res.getString("skills");
				String interview = res.getString("interview");
				Timestamp addTime = res.getTimestamp("addtime");
				String emplyer = res.getString("employer");
				boolean activition = res.getBoolean("activition");
				Job job = new Job(id, name, allNumber, worktime, workpoint, skills, interview, addTime, emplyer,
						activition);
				list.add(job);
			}
			if (list.size() == 0) {
				return null;
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<ScholarShip> getScholarShipByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM tb_scholarship WHERE NAME LIKE '%" + word + "%' OR request LIKE '%" + word + "%'";
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<ScholarShip> list = new ArrayList<ScholarShip>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				double money = res.getDouble("money");
				String request = res.getString("request");
				String number = res.getString("number");
				Timestamp addtime = res.getTimestamp("addtime");
				String stype = res.getString("stype");
				boolean activition = res.getBoolean("activition");
				ScholarShip ship = new ScholarShip(id, name, money, request, number, addtime, stype, activition);
				list.add(ship);
			}
			if (list.size() == 0) {
				return null;
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<GrantShip> getGrantShipByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM tb_grantship WHERE NAME LIKE '%" + word + "%' OR request LIKE '%" + word + "%'";
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<GrantShip> list = new ArrayList<GrantShip>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				double money = res.getDouble("money");
				String request = res.getString("request");
				String number = res.getString("number");
				Timestamp addtime = res.getTimestamp("addtime");
				String stype = res.getString("stype");
				boolean activition = res.getBoolean("activition");
				GrantShip ship = new GrantShip(id, name, money, request, number, addtime, stype, activition);
				list.add(ship);
			}
			if (list.size() == 0) {
				return null;
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateJob(Job job) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_job SET `name`='" + job.getName() + "',allNumber=" + job.getAllNumber() + ",worktime='"
				+ job.getWorktime() + "',workpoint='" + job.getWorkpoint() + "',skills='" + job.getSkills()
				+ "',interview='" + job.getInterview() + "',employer='" + job.getEmplyer() + "' WHERE id="
				+ job.getId();
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return false;
	}

	public boolean addJob(Job job) {
		Connection con = DBConnection.getConnection();
		String sql = "INSERT  INTO `tb_job`(`name`,`allNumber`,`worktime`,`workpoint`,`skills`,`interview`,`addTime`,`employer`) "
				+ "VALUES ('" + job.getName() + "'," + job.getAllNumber() + ",'" + job.getWorktime() + "','"
				+ job.getWorkpoint() + "','" + job.getSkills() + "','" + job.getInterview() + "','" + job.getAddTime()
				+ "','" + job.getEmplyer() + "')";
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return false;
	}

	public boolean deleteJob(int jobid) {
		Connection con = DBConnection.getConnection();

		String sql = "DELETE FROM tb_application WHERE requestid=" + jobid + " AND TYPE=2";
		String sql1 = "DELETE FROM tb_job WHERE id=" + jobid;
		System.out.println(sql + sql1);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) >= 0 && state.executeUpdate(sql1) > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return false;
	}

}
