package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.AdminLogDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.AdminLog;

public class AdminLogDaoImpl implements AdminLogDao {

	@Override
	public List<AdminLog> getLogsByWord(String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT * FROM tb_logs";
		if (word != null) {
			sql += " WHERE manager LIKE '%" + word + "%' OR operation LIKE '%" + word + "%'";
		}
		sql += " ORDER BY opttime DESC";
		System.out.println(sql);
		Statement state = null;
		ResultSet res = null;
		try {
			state = con.createStatement();
			res = state.executeQuery(sql);
			List<AdminLog> list = new ArrayList<AdminLog>();
			while (res.next()) {
				int id = res.getInt("id");
				int adminid = res.getInt("manager");
				String adminname = new UserDaoImpl().getUserNameById(adminid);
				Timestamp opttime = res.getTimestamp("opttime");
				String operation = res.getString("operation");
				AdminLog log = new AdminLog(id, adminid, adminname, opttime, operation);
				System.out.println(log);
				list.add(log);
			}
			if (list.size() == 0) {
				return null;
			}
			return list;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (res != null) {
				try {
					res.close();
				} catch (SQLException e) {
				}
			}
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
		return null;
	}

	@Override
	public void addLog(AdminLog log) {
		if (log == null) {
			return;
		}
		Connection con = DBConnection.getConnection();
		String sql = "INSERT  INTO `tb_logs`(`manager`,`opttime`,`operation`) VALUES (" + log.getAdminid() + ",'"
				+ log.getOpttime() + "','"+log.getOperation()+"')";
		System.out.println(sql);
		Statement state = null;
		try {
			state = con.createStatement();
			state.executeUpdate(sql);

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
	}

}
