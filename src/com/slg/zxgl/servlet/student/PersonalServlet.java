package com.slg.zxgl.servlet.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.PoorinfoDaoImpl;
import com.slg.zxgl.dao.impl.UserDaoImpl;
import com.slg.zxgl.entity.Poorinfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Student.PersonalServlet", urlPatterns = { "/student/personal.action" })
public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("student:personal.action");

		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String action = request.getParameter("action");
		System.out.println("个人信息" + action);
		String res = "personal";
		if (action != null) {
			res = res + "_" + action;
		}
		System.out.println("个人信息" + action);

		Student s = (Student) session.getAttribute("user");
		if ("poorinfo".equals(action)) {
			Poorinfo poorinfo = getPoorinfo(s);
			session.setAttribute("poorinfo", poorinfo);
		} else if ("password".equals(action)) {
			System.out.println("password:" + s);
			String oldpwd = request.getParameter("oldpassword");
			String newpwd = request.getParameter("newpassword");
			String againpwd = request.getParameter("againpassword");
			if (oldpwd != null && newpwd != null && againpwd != null) {
				oldpwd = new String(oldpwd.getBytes("ISO-8859-1"), "utf-8");
				newpwd = new String(newpwd.getBytes("ISO-8859-1"), "utf-8");
				againpwd = new String(againpwd.getBytes("ISO-8859-1"), "utf-8");
				if (checkPassword((User) s, oldpwd, newpwd, againpwd)) {
					s.setPassword(newpwd);
					session.setAttribute("user", s);
					res = "personal_" + "succeed";
				} else {
					res = res + "_" + "failure";
				}
				System.out.println(res);
				System.out.println(s);
			}
		}

		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/student.jsp");
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

	private Poorinfo getPoorinfo(Student s) {
		if (s.isPoor()) {
			return new PoorinfoDaoImpl().getPoorinfoById(s.getId());
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
