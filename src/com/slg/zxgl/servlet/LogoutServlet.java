package com.slg.zxgl.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.db.AdminLogUtil;
import com.slg.zxgl.entity.Manager;
import com.slg.zxgl.entity.User;

@WebServlet("/logout.action")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (Manager) session.getAttribute("user");
		try {
			AdminLogUtil.logAdminOperation(user.getId(), "ÍË³öµÇÂ½");
		} catch (Exception e) {
		}
		session.removeAttribute("user");
		Enumeration<String> names = session.getAttributeNames();
		if (names.hasMoreElements()) {
			String name = names.nextElement();
			session.removeAttribute(name);
		}
		session.setAttribute("result", "logout");
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
