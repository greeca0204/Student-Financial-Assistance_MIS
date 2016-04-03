package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.slg.zxgl.dao.StudentInfoDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.PoorStudentInfo;
import com.slg.zxgl.entity.Poorinfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.StudentInfo;

public class StudentDaoImpl implements StudentInfoDao {

	@Override
	public List<StudentInfo> getAllStudents() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT a.`id` id,a.`accname`,a.`name`,a.`gender`,a.`politicsstatus`,a.`nationality`,a.`identification`,"
				+ "a.`phone`,a.`address`,b.`name` classname,b.`collegename`,b.`gradename`,b.`majorname`,a.`ispoor`"
				+ " FROM tb_student a, (SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,tg.`name` gradename,"
				+ "tm.`name` majorname FROM tb_class tc,tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id` "
				+ "AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<StudentInfo> list = new ArrayList<StudentInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				StudentInfo stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality,
						identification, phone, address, classname, gradename, collegename, majorname, poor);
				System.out.println(stuinfo);
				list.add(stuinfo);
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

	@Override
	public List<StudentInfo> getStudentsByWord(String word) {

		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM (SELECT a.`id` id, a.`accname` accname ,a.`name` NAME,a.`gender` gender,"
				+ "a.`politicsstatus` politicsstatus,a.`nationality` nationality,"
				+ "a.`identification` identification,a.`phone` phone,a.`address` address,"
				+ "b.`name` classname,b.`collegename` collegename,b.`gradename` gradename,"
				+ "b.`majorname` majorname,a.`ispoor` ispoor FROM tb_student a, "
				+ "(SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,"
				+ "tg.`name` gradename,tm.`name` majorname FROM tb_class tc,"
				+ "tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id`"
				+ " AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`) allstus "
				+ "WHERE accname LIKE '%" + word + "%' OR NAME LIKE '%" + word + "%' OR `classname` LIKE '%" + word
				+ "%' " + "OR `collegename` LIKE '%" + word + "%' OR `gradename` LIKE '%" + word
				+ "%' OR `majorname` LIKE '%" + word + "%'";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<StudentInfo> list = new ArrayList<StudentInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				StudentInfo stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality,
						identification, phone, address, classname, gradename, collegename, majorname, poor);
				System.out.println(stuinfo);
				list.add(stuinfo);
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

	public Map<Integer, StudentInfo> getMapStudents() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT a.`id` id,a.`accname`,a.`name`,a.`gender`,a.`politicsstatus`,a.`nationality`,a.`identification`,"
				+ "a.`phone`,a.`address`,b.`name` classname,b.`collegename`,b.`gradename`,b.`majorname`,a.`ispoor`"
				+ " FROM tb_student a, (SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,tg.`name` gradename,"
				+ "tm.`name` majorname FROM tb_class tc,tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id` "
				+ "AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			Map<Integer, StudentInfo> map = new HashMap<Integer, StudentInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				StudentInfo stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality,
						identification, phone, address, classname, gradename, collegename, majorname, poor);
				System.out.println(stuinfo);
				map.put(id, stuinfo);
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

	public List<PoorStudentInfo> getPoorstusByWord(String word) {
		List<PoorStudentInfo> poorstus = new ArrayList<>();
		List<StudentInfo> stus = null;
		if (word == null) {
			stus = getAllStudents();
		} else {
			stus = getStudentsByWord(word);
		}
		if (stus != null) {
			for (StudentInfo stu : stus) {
				if (stu.isPoor()) {
					Poorinfo poor = new PoorinfoDaoImpl().getPoorinfoById(stu.getId());
					PoorStudentInfo poorstu = new PoorStudentInfo(poor, stu);
					poorstus.add(poorstu);
				}
			}
		}
		if (poorstus.size() == 0) {
			return null;
		} else {
			return poorstus;
		}
	}

	public StudentInfo getStudentById(int stuid) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM (SELECT a.`id` id, a.`accname` accname ,a.`name` NAME,a.`gender` gender,"
				+ "a.`politicsstatus` politicsstatus,a.`nationality` nationality,"
				+ "a.`identification` identification,a.`phone` phone,a.`address` address,"
				+ "b.`name` classname,b.`collegename` collegename,b.`gradename` gradename,"
				+ "b.`majorname` majorname,a.`ispoor` ispoor FROM tb_student a, "
				+ "(SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,"
				+ "tg.`name` gradename,tm.`name` majorname FROM tb_class tc,"
				+ "tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id`"
				+ " AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`) allstus "
				+ "WHERE id=" + stuid;

		System.out.println(sql);
		StudentInfo stuinfo = null;
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality, identification, phone,
						address, classname, gradename, collegename, majorname, poor);
				System.out.println(stuinfo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stuinfo;
	}

	public List<StudentInfo> getNotPoorByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM (SELECT a.`id` id, a.`accname` accname ,a.`name` NAME,a.`gender` gender,"
				+ "a.`politicsstatus` politicsstatus,a.`nationality` nationality,"
				+ "a.`identification` identification,a.`phone` phone,a.`address` address,"
				+ "b.`name` classname,b.`collegename` collegename,b.`gradename` gradename,"
				+ "b.`majorname` majorname,a.`ispoor` ispoor FROM tb_student a, "
				+ "(SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,"
				+ "tg.`name` gradename,tm.`name` majorname FROM tb_class tc,"
				+ "tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id`"
				+ " AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`) allstus "
				+ "WHERE accname LIKE '%" + word + "%' OR NAME LIKE '%" + word + "%' OR `classname` LIKE '%" + word
				+ "%' " + "OR `collegename` LIKE '%" + word + "%' OR `gradename` LIKE '%" + word
				+ "%' OR `majorname` LIKE '%" + word + "%'";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<StudentInfo> list = new ArrayList<StudentInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				if (!poor) {
					StudentInfo stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality,
							identification, phone, address, classname, gradename, collegename, majorname, poor);
					System.out.println(stuinfo);
					list.add(stuinfo);
				}
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

	public List<StudentInfo> getAllNotPoor() {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT a.`id` id,a.`accname`,a.`name`,a.`gender`,a.`politicsstatus`,a.`nationality`,a.`identification`,"
				+ "a.`phone`,a.`address`,b.`name` classname,b.`collegename`,b.`gradename`,b.`majorname`,a.`ispoor`"
				+ " FROM tb_student a, (SELECT tc.`id` id,tc.`name` NAME,tco.`name` collegename,tg.`name` gradename,"
				+ "tm.`name` majorname FROM tb_class tc,tb_college tco,tb_grade tg,tb_major tm WHERE tc.`collegeid`=tco.`id` "
				+ "AND tc.`gradeid`=tg.`id` AND tc.`majorid`=tm.`id`) b WHERE a.`classId`=b.`id`";

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<StudentInfo> list = new ArrayList<StudentInfo>();
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsstatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				String classname = res.getString("classname");
				String gradename = res.getString("gradename");
				String collegename = res.getString("collegename");
				String majorname = res.getString("majorname");
				boolean poor = res.getBoolean("ispoor");
				if (!poor) {
					StudentInfo stuinfo = new StudentInfo(id, accname, name, gender, politicsStatus, nationality,
							identification, phone, address, classname, gradename, collegename, majorname, poor);
					System.out.println(stuinfo);
					list.add(stuinfo);
				}
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

	public PoorStudentInfo getPoorstusByStuId(int stuid) {
		List<PoorStudentInfo> list = getPoorstusByWord(null);
		for (PoorStudentInfo info : list) {
			if (info.getStuId() == stuid) {
				return info;
			}
		}
		return null;
	}

	public boolean addStu(Student stu) {
		if (stu == null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "insert  into `tb_student`(`accname`,`name`,`gender`,`classId`,`politicsstatus`,`nationality`,`identification`,`phone`,`address`)"
				+ " values ('" + stu.getaccname() + "','" + stu.getName() + "','" + stu.getGender() + "',"
				+ stu.getClassId() + ",'" + stu.getPoliticsStatus() + "','" + stu.getNationlity() + "','"
				+ stu.getIdentification() + "','" + stu.getPhone() + "','" + stu.getAddress() + "')";

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
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public List<Student> getStusByWord(String word) {
		return new UserDaoImpl().getAllStusByWord(word);
	}

	public boolean deleteStu(int stuid) {
		Connection con = DBConnection.getConnection();

		String sql = "DELETE FROM tb_application WHERE stuid=" + stuid;
		String sql1 = "DELETE FROM tb_student WHERE id=" + stuid;
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

	public Student getStudent(int stuid) {
		return new UserDaoImpl().getAllStusById(stuid);
	}

	public boolean updateStu(Student stu) {
		if (stu == null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE `tb_student` SET `accname`='" + stu.getaccname() + "',`name`='" + stu.getName()
				+ "',`gender`='" + stu.getGender() + "',`classId`=" + stu.getClassId() + ",`politicsstatus`='"
				+ stu.getPoliticsStatus() + "',`nationality`='" + stu.getNationlity() + "',`identification`='"
				+ stu.getIdentification() + "',`phone`='" + stu.getPhone() + "',`address`='" + stu.getAddress()
				+ "' WHERE id=" + stu.getId();

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
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

}
