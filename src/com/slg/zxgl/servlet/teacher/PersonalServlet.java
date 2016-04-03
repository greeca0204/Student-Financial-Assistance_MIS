package com.slg.zxgl.servlet.teacher;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.UserDaoImpl;
import com.slg.zxgl.entity.Teacher;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Teacher.PersonalServlet", urlPatterns = { "/teacher/personal.action" })
public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("teacher:personal.action");

		String action = request.getParameter("action");
		System.out.println("更新内容:" + action);
		String res = "personal";
		if (action != null) {
			res = res + "_" + action;
		}
		System.out.println("教师个人信息" + action);
		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		Teacher t = (Teacher) session.getAttribute("user");
		if ("password".equals(action)) {
			System.out.println("password:" + t);
			String oldpwd = request.getParameter("oldpassword");
			String newpwd = request.getParameter("newpassword");
			String againpwd = request.getParameter("againpassword");
			if (oldpwd != null && newpwd != null && againpwd != null) {
				oldpwd = new String(oldpwd.getBytes("ISO-8859-1"), "utf-8");
				newpwd = new String(newpwd.getBytes("ISO-8859-1"), "utf-8");
				againpwd = new String(againpwd.getBytes("ISO-8859-1"), "utf-8");
				if (checkPassword((User) t, oldpwd, newpwd, againpwd)) {
					t.setPassword(newpwd);
					session.setAttribute("user", t);
					res = "personal_" + "succeed";
				} else {
					res = res + "_" + "failure";
				}
				System.out.println(res);
				System.out.println(t);
			}
		}

		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/teacher.jsp");
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
