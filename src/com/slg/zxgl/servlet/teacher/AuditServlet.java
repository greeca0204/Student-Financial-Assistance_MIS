package com.slg.zxgl.servlet.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.slg.zxgl.dao.impl.ApplicationDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;
import com.slg.zxgl.entity.ScholarShipApplication;

@WebServlet(name = "Teacher.AuditServlet", urlPatterns = { "/teacher/audit.action" })
public class AuditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("teacher:audit.action");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		System.out.println("审核:" + type);
		String res = "audit";
		if (type != null) {
			res = res + "_" + type;
			if ("scholarship".equals(type)) {
				String action = request.getParameter("action");
				if ("show".equals(action)) {
					res = res + "_" + action;
					int id = 0;
					try {
						id = Integer.parseInt(request.getParameter("id"));
					} catch (Exception e) {
					}
					ScholarShipApplication ship = ((List<ScholarShipApplication>) session.getAttribute("scholarships"))
							.get(id);
					session.setAttribute("ship", ship);
					System.out.println(ship);
				} else if ("audit".equals(action)) {
					res = res + "_" + action;
					String status = request.getParameter("status");
					ScholarShipApplication ship = (ScholarShipApplication) session.getAttribute("ship");
					if (status != null && ship != null) {
						if (aduitScholarship(status, ship.getAppId())) {
							res = res + "_succeed";
						} else {
							res = res + "_failure";
						}
					}
				} else {
					List<ScholarShipApplication> scholarships = getScholarShipApplications();
					System.out.println(scholarships);
					session.setAttribute("scholarships", scholarships);
				}
			}
		}
		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/teacher.jsp");
	}

	private boolean aduitScholarship(String status, int appid) {
		System.out.println("更改为：" + status);
		int check = 0;
		if ("true".equals(status)) {
			check = 1;
		} else if ("false".equals(status)) {
			check = 2;
		}
		return new ApplicationDaoImpl().updateApplication(appid, check);
	}

	private List<ScholarShipApplication> getScholarShipApplications() {
		return new SchoolInfoDaoImpl().getScholarShipApplications();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
