package com.slg.zxgl.servlet.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.entity.ApplicationInfo;
import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.Message;
import com.slg.zxgl.entity.StudentInfo;

@WebServlet(name = "Teacher.ShowServlet", urlPatterns = { "/teacher/show.action" })
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("teacher:show.action");
		// Ìø×ª
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		String action = request.getParameter("action");
		System.out.println("²éÑ¯:" + type);
		String res = "show";
		if (type != null) {
			if ("return".equals(action)) {
				res = "search";
			}
			res = res + "_" + type;
		}
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Object show = getShowById(type, id, session);
			System.out.println(show.getClass());
			session.setAttribute("show", show);
		} catch (Exception e) {
		}
		// TODO
		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/teacher.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@SuppressWarnings("unchecked")
	private Object getShowById(String type, int id, HttpSession session) {
		if ("stu".equals(type)) {
			List<StudentInfo> stus = (List<StudentInfo>) session.getAttribute("stus");
			if (stus != null) {
				return stus.get(id);
			}
		} else if ("info".equals(type)) {
			List<Message> infos = (List<Message>) session.getAttribute("infos");
			if (infos != null) {
				return infos.get(id);
			}
		} else if ("app".equals(type)) {
			List<ApplicationInfo> apps = (List<ApplicationInfo>) session.getAttribute("apps");
			if (apps != null) {
				return apps.get(id);
			}
		}else if ("class".equals(type)) {
			List<ClassInfo> stus = (List<ClassInfo>) session.getAttribute("classs");
			if (stus != null) {
				return stus.get(id);
			}
		} else if ("college".equals(type)) {
			List<CollegeInfo> stus = (List<CollegeInfo>) session.getAttribute("colleges");
			if (stus != null) {
				return stus.get(id);
			}
		} else if ("major".equals(type)) {
			List<MajorInfo> stus = (List<MajorInfo>) session.getAttribute("majors");
			if (stus != null) {
				return stus.get(id);
			}
		} else if ("grade".equals(type)) {
			List<GradeInfo> stus = (List<GradeInfo>) session.getAttribute("grades");
			if (stus != null) {
				return stus.get(id);
			}
		}
		return null;
	}

}
