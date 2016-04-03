package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.ApplicationDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.ApplicationInfo;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.GrantShipApplication;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.JobApplication;
import com.slg.zxgl.entity.Poorinfo;
import com.slg.zxgl.entity.StudentInfo;

public class ApplicationDaoImpl implements ApplicationDao {

	// 申请类型，0，奖学金，1，助学金，2：岗位，
	@Override
	public List<ApplicationInfo> getScholarShips(int stuid) {
		return getApplications(stuid, 0);
	}

	@Override
	public List<ApplicationInfo> getGrantShips(int stuid) {
		return getApplications(stuid, 1);
	}

	@Override
	public List<ApplicationInfo> getJobs(int stuid) {
		return getApplications(stuid, 2);
	}

	private List<ApplicationInfo> getApplications(int stuid, int i) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,requestid,ischeck,type from tb_application WHERE stuid=" + stuid + " AND type=" + i;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<ApplicationInfo> list = new ArrayList<ApplicationInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				int requestid = res.getInt("requestid");
				int ischeck = res.getInt("ischeck");
				int type = res.getInt("type");
				String name = "";
				System.out.println("请求id：" + requestid);
				switch (i) {
				case 0:
					// scholar
					name = getScholarShipName(requestid);
					break;
				case 1:
					// grant
					name = getGrantShipName(requestid);
					break;
				case 2:
					name = getJobNameById(requestid);
					// job
					break;
				}
				System.out.println(name);
				ApplicationInfo app = new ApplicationInfo(id, name, stuid, requestid, ischeck, type);
				list.add(app);
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

	private int getApplicationId(int stuid, int type, int requestid) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id from tb_application WHERE stuid=" + stuid + " AND type=" + type + " AND requestid="
				+ requestid;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				return res.getInt("id");
			}
			return 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	private String getScholarShipName(int requestid) {
		return getName(0, requestid);
	}

	private String getGrantShipName(int requestid) {
		return getName(1, requestid);
	}

	private String getJobNameById(int requestid) {
		return getName(2, requestid);
	}

	private String getName(int type, int id) {
		String TABLE_NAME = null;
		switch (type) {
		case 0:
			TABLE_NAME = "tb_scholarship";
			break;
		case 1:
			TABLE_NAME = "tb_grantship";
			break;
		case 2:
			return new JobDaoImpl().getJobNameById(id);
		}

		if (TABLE_NAME == null) {
			return null;
		}
		Connection con = DBConnection.getConnection();
		String sql = "SELECT name from TABLE_NAME WHERE id=" + id;
		sql = sql.replace("TABLE_NAME", TABLE_NAME);
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				return res.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	public boolean addApplication(int requestid, int stuid, int type) {
		Connection con = DBConnection.getConnection();

		if (getApplicationId(stuid, type, requestid) != 0) {
			System.out.println("已申请");
			return false;
		}
		String sql = "insert into tb_application(requestid,stuid,type) VALUES (" + requestid + "," + stuid + "," + type
				+ ")";

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

	public List<ApplicationInfo> getApplicationsByType(int type) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,stuid,requestid,ischeck,type from tb_application WHERE type=" + type;
		System.out.println(sql);
		List<ApplicationInfo> list = new ArrayList<ApplicationInfo>();
		Statement state = null;
		ResultSet res = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while (res.next()) {
				int id = res.getInt("id");
				int requestid = res.getInt("requestid");
				int ischeck = res.getInt("ischeck");
				int stuid = res.getInt("stuid");
				String name = "";
				System.out.println("请求id：" + requestid);
				switch (type) {
				case 0:
					// scholar
					name = getScholarShipName(requestid);
					break;
				case 1:
					// grant
					name = getGrantShipName(requestid);
					break;
				case 2:
					name = getJobNameById(requestid);
					// job
					break;
				}
				System.out.println(name);
				ApplicationInfo app = new ApplicationInfo(id, name, stuid, requestid, ischeck, type);
				list.add(app);
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
			if (res != null) {
				try {
					res.close();
				} catch (SQLException e) {
				}
			}
		}
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	public boolean updateApplication(int id, int check) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_application SET isCheck=" + check + " WHERE id=" + id;

		boolean flg = false;
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) > 0) {
				flg = true;
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
		return flg;
	}

	public List<GrantShipApplication> getGrantShipApplication(String word) {
		if (word == null) {
			word = "";
		}
		List<GrantShipApplication> list = new ArrayList<>();
		List<ApplicationInfo> apps = getApplicationsByType(1);
		for (ApplicationInfo app : apps) {
			StudentInfo stu = new StudentDaoImpl().getStudentById(app.getStuid());
			GrantShip ship = new ApplicationDaoImpl().getGrantShipById(app.getRequestid());
			Poorinfo poor = null;
			if (stu.isPoor()) {
				poor = new PoorinfoDaoImpl().getPoorinfoById(app.getStuid());
			}
			if (app != null && stu != null && poor != null && ship != null && (app.getName().contains(word)
					|| stu.getName().contains(word) || stu.getAccname().contains(word))) {
				GrantShipApplication grantship = new GrantShipApplication(app, ship, stu, poor);
				list.add(grantship);
			}
		}

		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	private GrantShip getGrantShipById(int requestid) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * from tb_grantship WHERE id=" + requestid;
		System.out.println(sql);
		GrantShip ship = null;
		Statement state = null;
		ResultSet res = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				double money = res.getDouble("money");
				String request = res.getString("request");
				String number = res.getString("number");
				Timestamp addtime = res.getTimestamp("addtime");
				String stype = res.getString("stype");
				boolean activition = res.getBoolean("activition");
				ship = new GrantShip(id, name, money, request, number, addtime, stype, activition);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			if (res != null) {
				try {
					res.close();
				} catch (SQLException e1) {
				}
			}
			if (state != null) {
				try {
					state.close();
				} catch (SQLException e1) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e1) {
				}
			}
		}
		return ship;
	}

	public List<JobApplication> getJobApplication(String word) {
		if (word == null) {
			word = "";
		}
		List<JobApplication> list = new ArrayList<>();
		List<ApplicationInfo> apps = getApplicationsByType(2);
		if (apps == null) {
			return null;
		}
		for (ApplicationInfo app : apps) {
			StudentInfo stu = new StudentDaoImpl().getStudentById(app.getStuid());
			Job job = new ApplicationDaoImpl().getJobById(app.getRequestid());
			Poorinfo poor = null;
			if (stu.isPoor()) {
				poor = new PoorinfoDaoImpl().getPoorinfoById(app.getStuid());
			}
			System.out.println(app.getName() + ":" + stu.getName() + ":" + stu.getAccname() + ":" + job.getInterview()
					+ ":" + word + ":" + app.getName().contains(word));
			if (app != null && stu != null && poor != null && job != null
					&& (app.getName().contains(word) || stu.getName().contains(word) || stu.getAccname().contains(word)
							|| job.getName().contains(word))) {
				JobApplication grantship = new JobApplication(app, job, stu, poor);
				list.add(grantship);
			}
		}

		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	private Job getJobById(int id) {
		return new JobDaoImpl().getJobById(id);
	}

}
