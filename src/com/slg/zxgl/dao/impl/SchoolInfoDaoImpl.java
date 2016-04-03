package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.slg.zxgl.dao.SchoolInfoDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.ApplicationInfo;
import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.ScholarShip;
import com.slg.zxgl.entity.ScholarShipApplication;
import com.slg.zxgl.entity.StudentInfo;

public class SchoolInfoDaoImpl implements SchoolInfoDao {

	@Override
	public String getClassNameBy(int classid) {
		return getNameByTbAndId("tb_class", classid);
	}

	private String getNameByTbAndId(String table, int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT name FROM " + table + " WHERE id=" + id;
		System.out.println(sql);
		String name = null;
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				name = res.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return name;
	}

	public ClassInfo getClassInfoById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT name,shortname,description,gradeid,collegeid,majorid from tb_class WHERE id=" + id;
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			// name,shortname,description,gradeid,collegeid,majorid
			if (res.next()) {
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				int gradeid = res.getInt("gradeid");
				int collegeid = res.getInt("collegeid");
				int majorid = res.getInt("majorid");
				String collegename = getCollegeNameById(collegeid);
				String majorname = getMajorNameById(majorid);
				String gradename = getGradeName(gradeid);
				ClassInfo classInfo = new ClassInfo(id, name, shortname, description, gradeid, gradename, collegeid,
						collegename, majorid, majorname);
				System.out.println(classInfo);
				return classInfo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	private String getGradeName(int gradeid) {
		return getNameByTbAndId("tb_grade", gradeid);
	}

	private String getMajorNameById(int majorid) {
		return getNameByTbAndId("tb_major", majorid);
	}

	private String getCollegeNameById(int collegeid) {
		return getNameByTbAndId("tb_college", collegeid);
	}

	public List<ClassInfo> getClasss(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,shortname,description,gradeid,collegeid,majorid from tb_class";
		if (word != null) {
			sql = sql + " WHERE name LIKE '%" + word + "%' OR description LIKE '%" + word + "%'";
		}
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<ClassInfo> list = new ArrayList<ClassInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				int gradeid = res.getInt("gradeid");
				int collegeid = res.getInt("collegeid");
				int majorid = res.getInt("majorid");
				String collegename = getCollegeNameById(collegeid);
				String majorname = getMajorNameById(majorid);
				String gradename = getGradeName(gradeid);
				ClassInfo classInfo = new ClassInfo(id, name, shortname, description, gradeid, gradename, collegeid,
						collegename, majorid, majorname);
				list.add(classInfo);
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

	public List<CollegeInfo> getColleges(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,shortname,description FROM tb_college";
		if (word != null) {
			sql = sql + " WHERE name LIKE '%" + word + "%' OR  description LIKE '%" + word + "%'";
		}
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<CollegeInfo> list = new ArrayList<CollegeInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				CollegeInfo collegeInfo = new CollegeInfo(id, name, shortname, description);
				list.add(collegeInfo);
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

	public List<MajorInfo> getMajors(String word) {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,shortname,description FROM tb_major";
		if (word != null) {
			sql = sql + " WHERE name LIKE '%" + word + "%' OR  description LIKE '%" + word + "%'";
		}
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<MajorInfo> list = new ArrayList<MajorInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				MajorInfo majorInfo = new MajorInfo(id, name, shortname, description);
				list.add(majorInfo);
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

	public List<GradeInfo> getGrades(String word) {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,description FROM tb_grade";
		if (word != null) {
			sql = sql + " WHERE name LIKE '%" + word + "%' OR description LIKE '%" + word + "%'";
		}
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<GradeInfo> list = new ArrayList<GradeInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String description = res.getString("description");
				GradeInfo gradeInfo = new GradeInfo(id, name, description);
				list.add(gradeInfo);
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

	public CollegeInfo getCollegeInfoById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,shortname,description FROM tb_college WHERE id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				CollegeInfo collegeInfo = new CollegeInfo(id, name, shortname, description);
				return collegeInfo;
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public MajorInfo getMajorInfoById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,shortname,description FROM tb_major WHERE id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			while (res.next()) {
				String name = res.getString("name");
				String shortname = res.getString("shortname");
				String description = res.getString("description");
				MajorInfo majorInfo = new MajorInfo(id, name, shortname, description);
				return majorInfo;
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public GradeInfo getGradeInfoById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,description FROM tb_grade WHERE id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			while (res.next()) {
				String name = res.getString("name");
				String description = res.getString("description");
				GradeInfo gradeInfo = new GradeInfo(id, name, description);
				return gradeInfo;
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<GrantShip> getGrantShips(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,money,request,number,addtime,stype,activition FROM tb_grantship";
		if (word != null) {
			sql += " WHERE name LIKE '%" + word + "%' OR request LIKE '%" + word + "%'";
		}
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

	public GrantShip getGrantShipById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,money,request,number,addtime,stype,activition FROM tb_grantship WHERE id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				String name = res.getString("name");
				double money = res.getDouble("money");
				String request = res.getString("request");
				String number = res.getString("number");
				Timestamp addtime = res.getTimestamp("addtime");
				String stype = res.getString("stype");
				boolean activition = res.getBoolean("activition");
				return new GrantShip(id, name, money, request, number, addtime, stype, activition);
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ScholarShip getScholarShipById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,money,request,number,addtime,stype,activition FROM tb_scholarship WHERE id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				String name = res.getString("name");
				double money = res.getDouble("money");
				String request = res.getString("request");
				String number = res.getString("number");
				Timestamp addtime = res.getTimestamp("addtime");
				String stype = res.getString("stype");
				boolean activition = res.getBoolean("activition");
				return new ScholarShip(id, name, money, request, number, addtime, stype, activition);
			}
			return null;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<ScholarShip> getScholarShips() {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,money,request,number,addtime,stype,activition FROM tb_scholarship";

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

	public List<ScholarShipApplication> getScholarShipApplications() {
		return getApplications(0);
	}

	private List<ScholarShipApplication> getApplications(int type) {
		List<ApplicationInfo> apps = new ApplicationDaoImpl().getApplicationsByType(type);
		Map<Integer, StudentInfo> stus = new StudentDaoImpl().getMapStudents();
		Map<Integer, ScholarShip> ships = new SchoolInfoDaoImpl().getMapScholarShips();
		List<ScholarShipApplication> list = new ArrayList<>();
		for (ApplicationInfo app : apps) {
			if (stus.containsKey(app.getStuid()) && ships.containsKey(app.getRequestid())) {
				StudentInfo stu = stus.get(app.getStuid());
				ScholarShip ship = ships.get(app.getRequestid());
				ScholarShipApplication shipapp = new ScholarShipApplication(app, stu, ship);
				list.add(shipapp);
			}
		}
		return list;
	}

	private Map<Integer, ScholarShip> getMapScholarShips() {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name,money,request,number,addtime,stype,activition FROM tb_scholarship";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, ScholarShip> map = new HashMap<Integer, ScholarShip>();
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
				map.put(id, ship);
			}
			if (map.size() == 0) {
				return null;
			}
			return map;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addGrantShip(GrantShip ship) {
		Connection con = DBConnection.getConnection();
		String sql = "INSERT  INTO `tb_grantship`(`name`,`money`,`request`,`number`,`addtime`,`stype`,`activition`) VALUES ('"
				+ ship.getName() + "'," + ship.getMoney() + ",'" + ship.getRequest() + "','" + ship.getNumber() + "','"
				+ ship.getAddtime().toString() + "','" + ship.getStype() + "',1);";
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

	public boolean deleteGrantShip(int shipid) {
		Connection con = DBConnection.getConnection();

		String sql = "DELETE FROM tb_application WHERE requestid=" + shipid + " AND TYPE=1";
		String sql1 = "DELETE FROM tb_grantship WHERE id=" + shipid;
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

	public boolean updateGrantShip(GrantShip ship) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_grantship SET `name`='" + ship.getName() + "',`money`=" + ship.getMoney()
				+ ",`request`='" + ship.getRequest() + "',`number`=" + ship.getNumber() + ",`stype`='" + ship.getStype()
				+ "' WHERE id=" + ship.getId();
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

	public Map<Integer, String> getClassNameId() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name from tb_class";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public Map<Integer, String> getTeaNameId() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,NAME FROM tb_teacher";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public Map<Integer, String> getStuNameId() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,NAME FROM tb_student";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public boolean addCollegeInfo(CollegeInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "insert  into `tb_college`(`name`,`shortname`,`description`) values ('" + info.getName() + "','"
				+ info.getShortname() + "','" + info.getDescription() + "');";
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

	public boolean deleteCollege(int collegeid) {
		Connection con = DBConnection.getConnection();
		String sql = "DELETE FROM tb_college WHERE id=" + collegeid;
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

	public boolean updateCollegeInfo(CollegeInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_college SET `name`='" + info.getName() + "',`shortname`='" + info.getShortname()
				+ "',`description`='" + info.getDescription() + "' WHERE id=" + info.getId();
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

	public boolean addGradeInfo(GradeInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "insert  into `tb_grade`(`name`,`description`) values ('" + info.getName() + "','"
				+ info.getDescription() + "')";
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

	public boolean deleteGrade(int gradeid) {
		Connection con = DBConnection.getConnection();
		String sql = "DELETE FROM tb_grade WHERE id=" + gradeid;
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

	public boolean updateGradeInfo(GradeInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_grade SET `name`='" + info.getName() + "',`description`='" + info.getDescription()
				+ "' WHERE id=" + info.getId();
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

	public boolean addMajorInfo(MajorInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "insert  into `tb_major`(`name`,`shortname`,`description`) values ('" + info.getName() + "','"
				+ info.getShortname() + "','" + info.getDescription() + "');";
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

	public boolean deleteMajorInfo(int majorid) {
		Connection con = DBConnection.getConnection();
		String sql = "DELETE FROM tb_major WHERE id=" + majorid;
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

	public boolean updateMajorInfo(MajorInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_major SET `name`='" + info.getName() + "',`shortname`='" + info.getShortname()
				+ "',`description`='" + info.getDescription() + "' WHERE id=" + info.getId();
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

	public Map<Integer, String> getCollegeNameId() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name from tb_college";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public Map<Integer, String> getGradeNameId() {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name from tb_grade";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public Map<Integer, String> getMajorNameId() {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,name from tb_major";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, String> list = new HashMap<Integer, String>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				list.put(id, name);
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

	public boolean addClassInfo(ClassInfo info) {
		if (info == null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		if (getClassInfoByName(info.getName())) {
			return false;
		}
		String sql = "INSERT  INTO `tb_class`(`name`,`shortname`,`description`,`gradeid`,`collegeid`,`majorid`) "
				+ "VALUES ('" + info.getName() + "','" + info.getShortname() + "','" + info.getDescription() + "',"
				+ info.getGradeid() + "," + info.getCollegeid() + "," + info.getMajorid() + ")";
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

	private boolean getClassInfoByName(String name) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id from tb_class WHERE name='" + name + "'";
		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateClassInfo(ClassInfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_class SET `majorid`=" + info.getMajorid() + ",`gradeid`=" + info.getGradeid()
				+ ",`collegeid`=" + info.getCollegeid() + ",`name`='" + info.getName() + "',`shortname`='"
				+ info.getShortname() + "',`description`='" + info.getDescription() + "' WHERE id=" + info.getId();
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

	public boolean deleteClass(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "DELETE FROM tb_class WHERE id=" + id;
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

}
