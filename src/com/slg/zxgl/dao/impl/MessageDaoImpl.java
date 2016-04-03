package com.slg.zxgl.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.slg.zxgl.dao.MessageDao;
import com.slg.zxgl.db.DBConnection;
import com.slg.zxgl.entity.Message;

public class MessageDaoImpl implements MessageDao {

	private final static String TABLE_NAME = "tb_message";

	@Override
	public List<Message> getAllMessages(int msgType, int target) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,title,addtime,details from TABLE_NAME";
		if (msgType != 0) {
			sql =sql+ " WHERE type=" + msgType + " and target=" + target;
		}
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Message> list = new ArrayList<Message>();
			while (res.next()) {
				int id = res.getInt("id");
				String title = res.getString("title");
				Timestamp addtime = res.getTimestamp("addtime");
				String details = res.getString("details");
				Message msg = new Message();
				msg.setId(id);
				msg.setTitle(title);
				msg.setAddtime(addtime);
				msg.setDetails(details);
				list.add(msg);
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

	public Message getMessageById(int id) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT title,details,addtime from TABLE_NAME WHERE id=" + id;

		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			if (res.next()) {
				String title = res.getString(1);
				String details = res.getString(2);
				Timestamp addtime = res.getTimestamp(3);
				Message msg = new Message();
				msg.setId(id);
				msg.setTitle(title);
				msg.setDetails(details);
				msg.setAddtime(addtime);
				return msg;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public List<Message> getMessageByWord(int msgType, String word) {
		Connection con = DBConnection.getConnection();
		String sql = "SELECT id,title,addtime from TABLE_NAME";
		if (msgType != 0) {
			sql = "SELECT id,title,addtime,details from TABLE_NAME where type=" + msgType + " AND title LIKE '%" + word
					+ "%' OR details LIKE '%" + word + "%'";
		}
		sql = sql.replace("TABLE_NAME", TABLE_NAME);

		System.out.println(sql);
		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(sql);
			List<Message> list = new ArrayList<Message>();
			while (res.next()) {
				int id = res.getInt("id");
				String title = res.getString("title");
				String details = res.getString("details");
				Timestamp addtime = res.getTimestamp("addtime");
				Message msg = new Message();
				msg.setId(id);
				msg.setTitle(title);
				msg.setDetails(details);
				msg.setAddtime(addtime);
				list.add(msg);
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

	public boolean addMessage(Message info, int type, int target) {
		if (info == null || type == -1 || target == -1) {
			return false;
		}
		Connection con = DBConnection.getConnection();
		String sql = "INSERT  INTO `tb_message`(`title`,`type`,`target`,`details`,`addtime`) VALUES ('"
				+ info.getTitle() + "'," + type + "," + target + ",'" + info.getDetails() + "','" + info.getAddtime()
				+ "')";

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
