package com.slg.zxgl.servlet.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.UserDaoImpl;
import com.slg.zxgl.db.AdminLogUtil;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Manager.PersonalServlet", urlPatterns = { "/manager/personal.action" })
public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("manager:perssonal.action");
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;

		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		System.out.println("管理者:" + action);
		String res = "personal";
		if (action != null) {
			res = res + "_" + action;
		}
		User user = (User) request.getSession().getAttribute("user");
		if ("update".equals(action)) {
			String name = request.getParameter("name");
			if (name != null) {
				try {
					AdminLogUtil.logAdminOperation(user.getId(), "更改个人信息");
				} catch (Exception e) {
				}
				name = new String(name.getBytes("ISO-8859-1"), "utf-8");
				System.out.println(user);
				if (new UserDaoImpl().updateUserName(user, name)) {
					user.setName(name);
					session.setAttribute("user", user);
					res = "personal_" + "succeed";
				} else {
					res = res + "_" + "failure";
				}
				System.out.println(res);
				System.out.println(user);
			}
		} else if ("password".equals(action)) {
			System.out.println("password:" + user);
			String oldpwd = request.getParameter("oldpassword");
			String newpwd = request.getParameter("newpassword");
			String againpwd = request.getParameter("againpassword");
			if (oldpwd != null && newpwd != null && againpwd != null) {
				try {
					AdminLogUtil.logAdminOperation(user.getId(), "更改密码");
				} catch (Exception e) {
				}
				oldpwd = new String(oldpwd.getBytes("ISO-8859-1"), "utf-8");
				newpwd = new String(newpwd.getBytes("ISO-8859-1"), "utf-8");
				againpwd = new String(againpwd.getBytes("ISO-8859-1"), "utf-8");
				if (checkPassword(user, oldpwd, newpwd, againpwd)) {
					user.setPassword(newpwd);
					session.setAttribute("user", user);
					res = "personal_" + "succeed";
				} else {
					res = res + "_" + "failure";
				}
				System.out.println(res);
				System.out.println(user);
			}
		}
		System.out.println(res);
		// 返回
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/manager.jsp");
	}

	private boolean checkPassword(User user, String oldpwd, String newpwd, String againpwd) {
		if (user == null || oldpwd == null || oldpwd.length() < 8 || newpwd == null || newpwd.length() < 8
				|| againpwd == null || againpwd.length() < 8 || !newpwd.equals(againpwd)) {
			return false;

		}
		if (new UserDaoImpl().updateUserPassword(user, newpwd)) {
			return true;
		}
		return false;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
