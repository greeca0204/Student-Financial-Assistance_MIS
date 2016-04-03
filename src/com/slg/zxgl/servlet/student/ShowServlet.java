package com.slg.zxgl.servlet.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.slg.zxgl.dao.impl.MessageDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;

@WebServlet("/student/show.action")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("student:show.action");

		String type = request.getParameter("type");
		int id = Integer.parseInt(request.getParameter("id"));
		// Ìø×ª
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();
		Object show = getShowById(type, id);
		System.out.println(show.getClass());
		session.setAttribute("show", show);
		session.setAttribute("result", "show_" + type);
		response.sendRedirect(basePath + "/student.jsp");
	}

	private Object getShowById(String type, int id) {
		if ("info".equals(type)) {
			return new MessageDaoImpl().getMessageById(id);
		} else if ("class".equals(type)) {
			return new SchoolInfoDaoImpl().getClassInfoById(id);
		} else if ("college".equals(type)) {
			return new SchoolInfoDaoImpl().getCollegeInfoById(id);
		} else if ("major".equals(type)) {
			return new SchoolInfoDaoImpl().getMajorInfoById(id);
		} else if ("grade".equals(type)) {
			return new SchoolInfoDaoImpl().getGradeInfoById(id);
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
