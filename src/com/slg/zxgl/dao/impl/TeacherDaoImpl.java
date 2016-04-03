package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.TeacherDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.Teacher;

public class TeacherDaoImpl implements TeacherDao {

	public List<Teacher> getTeachersByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,classId,department,position,positiontitle,phone,email FROM tb_teacher";
		if (word != null) {
			sql = sql + " WHERE NAME LIKE '%" + word + "%' OR department LIKE '%" + word + "%' OR POSITION LIKE '%"
					+ word + "%' OR positiontitle LIKE '%" + word + "%'";
		}
		System.out.println(sql);
		List<Teacher> list = new ArrayList<Teacher>();
		Statement state = null;
		ResultSet res = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			while (res.next()) {
				int id = res.getInt("id");
				String accname = res.getString("accname");
				String name = res.getString("name");
				int classId = res.getInt("classId");
				String className = new SchoolInfoDaoImpl().getClassNameBy(classId);
				String department = res.getString("department");
				String position = res.getString("position");
				String positiontitle = res.getString("positiontitle");
				String phone = res.getString("phone");
				String email = res.getString("email");
				Teacher tea = new Teacher(id, accname, null, 2, name, classId, className, department, position,
						positiontitle, phone, email);
				list.add(tea);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
			if (state != null) {
				try {
					state.close();
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

	public boolean addTea(Teacher tea) {
		if (tea == null) {
			return false;
		}
		if (getTeachersByAccName(tea.getaccname()) != null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "INSERT INTO `tb_teacher`(`accname`,`name`,`classid`,`department`,`position`,`positiontitle`,`phone`,`email`) "
				+ "values ('" + tea.getaccname() + "','" + tea.getName() + "'," + tea.getClassId() + ",'"
				+ tea.getDepartment() + "','" + tea.getPosition() + "','" + tea.getPositiontitle() + "','"
				+ tea.getPhone() + "','" + tea.getEmail() + "');";

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

	private Teacher getTeachersByAccName(String accname) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,accname,name,classId,department,position,positiontitle,phone,email FROM tb_teacher WHERE accname="
				+ accname;
		System.out.println(sql);
		Statement state = null;
		ResultSet res = null;
		Teacher tea = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				String name = res.getString("name");
				int classId = res.getInt("classId");
				String className = new SchoolInfoDaoImpl().getClassNameBy(classId);
				String department = res.getString("department");
				String position = res.getString("position");
				String positiontitle = res.getString("positiontitle");
				String phone = res.getString("phone");
				String email = res.getString("email");
				tea = new Teacher(id, accname, null, 2, name, classId, className, department, position, positiontitle,
						phone, email);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
			if (state != null) {
				try {
					state.close();
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
		return tea;
	}

	public Teacher getTeacherById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT accname,name,classId,department,position,positiontitle,phone,email FROM tb_teacher WHERE id="
				+ id;
		System.out.println(sql);
		Statement state = null;
		ResultSet res = null;
		Teacher tea = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			if (res.next()) {
				String accname = res.getString("accname");
				String name = res.getString("name");
				int classId = res.getInt("classId");
				String className = new SchoolInfoDaoImpl().getClassNameBy(classId);
				String department = res.getString("department");
				String position = res.getString("position");
				String positiontitle = res.getString("positiontitle");
				String phone = res.getString("phone");
				String email = res.getString("email");
				tea = new Teacher(id, accname, null, 2, name, classId, className, department, position, positiontitle,
						phone, email);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
			if (state != null) {
				try {
					state.close();
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
		return tea;
	}

	public boolean updateTeacher(Teacher tea) {
		if (tea == null) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE `tb_teacher` SET `accname`='" + tea.getaccname() + "',`name`='" + tea.getName()
				+ "',`classId`=" + tea.getClassId() + ",`department`='" + tea.getDepartment() + "',`position`='"
				+ tea.getPosition() + "',`positiontitle`='" + tea.getPositiontitle() + "',`phone`='" + tea.getPhone()
				+ "',`email`='" + tea.getEmail() + "' WHERE id=" + tea.getId();

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

	public boolean deleteTeacher(int id) {
		Connection con = DBConnection.getConnection();

		String sql = "DELETE FROM tb_teacher WHERE id=" + id;
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
