package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.UserDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.Manager;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.Teacher;
import com.slg.zxgl.entity.User;

public class UserDaoImpl implements UserDao {

	// 0：管理员 查询表tb_sysuser
	// 1 ：学生 查询表tb_student
	// 2：教师 查询tb_teacher
	// 3：用人单位 查询tb_employer
	private final static String TABLE_SYSUSER = "tb_sysuser";
	private final static String TABLE_STUDENT = "tb_student";
	private final static String TABLE_TEACHER = "tb_teacher";
	private final static String SEARCH_TEA = "id,accname,password,name,classId,department,department,position,positiontitle,phone,email";
	private final static String SEARCH_STU = "id,accname,password,name,gender,classId,politicsstatus,nationality,identification,phone,address,ispoor";
	private final static String SEARCH_ADMIN = "id,accname,password,name,permission";

	@Override
	public User getUserByNamePass(String accname, int userType) {
		User u = null;
		Connection con = DBConnection.getConnection();
		String sql = "SELECT SEARCH_INFO from TABLE_NAME WHERE accname=?";
		String TABLE_NAME = null;
		String SEARCH_INFO = null;
		switch (userType) {
		case 0:
			TABLE_NAME = TABLE_SYSUSER;
			SEARCH_INFO = SEARCH_ADMIN;
			break;
		case 1:
			TABLE_NAME = TABLE_STUDENT;
			SEARCH_INFO = SEARCH_STU;
			break;
		case 2:
			TABLE_NAME = TABLE_TEACHER;
			SEARCH_INFO = SEARCH_TEA;
			break;
		default:
			TABLE_NAME = null;
			SEARCH_INFO = null;
			break;
		}
		if (TABLE_NAME == null || SEARCH_INFO == null) {
			return null;
		}
		sql = sql.replace("TABLE_NAME", TABLE_NAME);
		sql = sql.replace("SEARCH_INFO", SEARCH_INFO);
		System.out.println(sql);
		try {
			PreparedStatement state = con.prepareStatement(sql);
			state.setString(1, accname);
			ResultSet res = state.executeQuery();
			if (res.next()) {
				int id = res.getInt(1);
				String password = res.getString(3);
				String name = res.getString(4);
				if (userType == 0) {
					// permission
					int permission = res.getInt(5);
					u = new Manager(id, accname, password, userType, name, permission);
				} else if (userType == 1) {
					// gender,classId,politicsstatus,nationality,identification,phone,address,classid,ispoor
					String gender = res.getString("gender");
					String politicsStatus = res.getString("politicsstatus");
					String nationlity = res.getString("nationality");
					String identification = res.getString("identification");
					String phone = res.getString("phone");
					String address = res.getString("address");
					boolean ispoor = res.getBoolean("ispoor");
					int classId = res.getInt("classId");
					String classname = new SchoolInfoDaoImpl().getClassNameBy(classId);
					u = new Student(id, accname, password, userType, name, gender, politicsStatus, nationlity,
							identification, phone, address, classId, classname, ispoor);
				} else if (userType == 2) {
					// classId,department,department,position,positiontitle,phone,email
					int classId = res.getInt("classId");
					String department = res.getString("department");
					String position = res.getString("position");
					String positiontitle = res.getString("positiontitle");
					String phone = res.getString("phone");
					String email = res.getString("email");
					String className = new SchoolInfoDaoImpl().getClassNameBy(classId);
					u = new Teacher(id, accname, password, userType, name, classId, className, department, position,
							positiontitle, phone, email);
				}
				System.out.println(u);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public boolean updateUserName(User user, String name) {
		if (user == null || name == null || "".equals(name)) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE TABLE_NAME SET name=? WHERE id=?";
		String TABLE_NAME = SEARCH_ADMIN;
		switch (user.getUserType()) {
		case 0:
			TABLE_NAME = TABLE_SYSUSER;
			break;
		case 1:
			TABLE_NAME = TABLE_STUDENT;
			break;
		case 2:
			TABLE_NAME = TABLE_TEACHER;
			break;
		default:
			TABLE_NAME = null;
			break;
		}
		if (TABLE_NAME == null) {
			return false;
		}
		sql = sql.replace("TABLE_NAME", TABLE_NAME);
		System.out.println(sql);
		try {
			PreparedStatement state = con.prepareStatement(sql);
			state.setString(1, name);
			state.setInt(2, user.getId());
			System.out.println("userid:" + user.getId());
			if (state.executeUpdate() > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public boolean updateUserPassword(User user, String newpwd) {
		if (user == null || newpwd == null || "".equals(newpwd)) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE TABLE_NAME SET password=? WHERE id=?";
		String TABLE_NAME = SEARCH_ADMIN;
		switch (user.getUserType()) {
		case 0:
			TABLE_NAME = TABLE_SYSUSER;
			break;
		case 1:
			TABLE_NAME = TABLE_STUDENT;
			break;
		case 2:
			TABLE_NAME = TABLE_TEACHER;
			break;
		default:
			TABLE_NAME = null;
			break;
		}
		if (TABLE_NAME == null) {
			return false;
		}
		sql = sql.replace("TABLE_NAME", TABLE_NAME);
		System.out.println(sql);
		try {
			PreparedStatement state = con.prepareStatement(sql);
			state.setString(1, newpwd);
			state.setInt(2, user.getId());
			System.out.println("userid:" + user.getId());
			if (state.executeUpdate() > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public List<Manager> getAllAdmins(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,permission FROM tb_sysuser";
		if (word != null) {
			sql += " WHERE NAME LIKE '%" + word + "%'";
		}

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Manager> list = new ArrayList<Manager>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String accname = res.getString("accname");
				int permission = res.getInt("permission");
				Manager user = new Manager(id, accname, null, 0, name, permission);
				list.add(user);
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

	public List<Student> getAllStusByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,gender,politicsStatus,nationality,identification,phone,address,classid,ispoor FROM tb_student";
		if (word != null) {
			sql += " WHERE NAME LIKE '%" + word + "%'";
		}

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Student> list = new ArrayList<Student>();
			while (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String accname = res.getString("accname");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsStatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				int classid = res.getInt("classid");
				String classname = new SchoolInfoDaoImpl().getClassNameBy(classid);
				boolean poor = res.getBoolean("ispoor");
				Student user = new Student(id, accname, null, 1, name, gender, politicsStatus, nationality,
						identification, phone, address, classid, classname, poor);
				list.add(user);
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

	public Student getAllStusById(int stuid) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,gender,politicsStatus,nationality,identification,phone,address,classid,ispoor FROM tb_student WHERE id="
				+ stuid;

		System.out.println(sql);
		Student user = null;
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				String accname = res.getString("accname");
				String gender = res.getString("gender");
				String politicsStatus = res.getString("politicsStatus");
				String nationality = res.getString("nationality");
				String identification = res.getString("identification");
				String phone = res.getString("phone");
				String address = res.getString("address");
				int classid = res.getInt("classid");
				String classname = new SchoolInfoDaoImpl().getClassNameBy(classid);
				boolean poor = res.getBoolean("ispoor");
				user = new Student(id, accname, null, 1, name, gender, politicsStatus, nationality, identification,
						phone, address, classid, classname, poor);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public String getUserNameById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT name,permission FROM tb_sysuser where id=" + id;

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			while (res.next()) {
				String name = res.getString("name");
				int permission = res.getInt("permission");
				String accname = "系统管理员";
				switch (permission) {
				case 1:
					accname = "系统管理员";
					break;
				case 2:
					accname = "人事管理员";
					break;
				case 3:
					accname = "贫困生管理员";
					break;
				case 4:
					accname = "助学管理员";
					break;

				default:
					break;
				}
				return accname + ":" + name;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addManager(Manager m) {
		if (m == null) {
			return false;
		}
		if (getAdminsByAccName(m.getaccname()) != null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "insert  into `tb_sysuser`(`accname`,`name`,`permission`) values ('" + m.getaccname() + "','"
				+ m.getName() + "'," + m.getPermssion() + ")";

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

	private Manager getAdminsByAccName(String accname) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,permission FROM tb_sysuser WHERE accname='" + accname + "'";

		System.out.println(sql);
		Manager user = null;
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				int permission = res.getInt("permission");
				user = new Manager(id, accname, null, 0, name, permission);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean deleteAdmin(int id) {
		Connection con = DBConnection.getConnection();

		String sql = "DELETE FROM tb_sysuser WHERE id=" + id;
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

	public Manager getAdminById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,permission FROM tb_sysuser WHERE id='" + id + "'";

		System.out.println(sql);
		Manager user = null;
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				String accname = res.getString("accname");
				String name = res.getString("name");
				int permission = res.getInt("permission");
				user = new Manager(id, accname, null, 0, name, permission);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean updateAdmin(Manager m) {
		if (m == null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE `tb_sysuser` SET `accname`='" + m.getaccname() + "',`name`='" + m.getName()
				+ "',`permission`=" + m.getPermssion() + " WHERE id=" + m.getId();

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
