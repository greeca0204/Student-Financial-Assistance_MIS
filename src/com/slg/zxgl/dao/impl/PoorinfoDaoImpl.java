package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.slg.zxgl.dao.PoorinfoDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.Poorinfo;

public class PoorinfoDaoImpl implements PoorinfoDao {

	private final static String TABLE_NAME = "tb_student_poorgrade";

	@Override
	public Poorinfo getPoorinfoById(int stuid) {
		Connection con = DBConnection.getConnection();
		// id,stuid,homepeople,homeincome,poorgrade
		String sql = "SELECT id,stuid,homepeople,homeincome,poorgrade from TABLE_NAME WHERE stuid=" + stuid;
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				int id = res.getInt("id");
				int sid = res.getInt("stuid");
				int homepeople = res.getInt("homepeople");
				int homeincome = res.getInt("homeincome");
				int poorgrade = res.getInt("poorgrade");
				return new Poorinfo(id, sid, homepeople, homeincome, poorgrade);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public boolean addPoorinfo(Poorinfo info) {
		Connection con = DBConnection.getConnection();

		if (getPoorinfoById(info.getStuid()) != null) {
			System.out.println("已经是贫困生");
			return false;
		}
		String sql = "insert into tb_student_poorgrade(stuid,homeincome,homepeople,poorgrade) VALUES ("
				+ info.getStuid() + "," + info.getHomeincome() + "," + info.getHomepeople() + "," + info.getPoorgrade()
				+ ")";
		String sql1 = "UPDATE tb_student SET ispoor=1 WHERE id=" + info.getStuid();
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) > 0 && state.executeUpdate(sql1) > 0) {
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

	public boolean updatePoorinfo(Poorinfo info) {
		Connection con = DBConnection.getConnection();
		String sql = "UPDATE tb_student_poorgrade SET homeincome=" + info.getHomeincome() + ",homepeople="
				+ info.getHomepeople() + ",poorgrade=" + info.getPoorgrade() + " WHERE id=" + info.getId();
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

	public boolean deletePoorinfo(int stuid) {
		String sql = "UPDATE tb_student SET ispoor=0 WHERE id=" + stuid;
		String sql1 = "DELETE FROM tb_student_poorgrade WHERE stuid=" + stuid;
		Connection con = DBConnection.getConnection();
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			if (state.executeUpdate(sql) > 0 && state.executeUpdate(sql1)>0) {
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
