package com.slg.zxgl.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.ApplicationDaoImpl;
import com.slg.zxgl.db.AdminLogUtil;
import com.slg.zxgl.entity.GrantShipApplication;
import com.slg.zxgl.entity.JobApplication;
import com.slg.zxgl.entity.Manager;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Manager.AuditServlet", urlPatterns = { "/manager/audit.action" })
public class AuditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("manager:audit.action");
		request.setCharacterEncoding("UTF-8");

		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		System.out.println("审核" + type);
		String res = "audit";
		if (type != null) {
			res = res + "_" + type;
		}
		String action = request.getParameter("action");
		System.out.println("审核" + type+";"+action);

		if ("grantship".equals(type)) {
			if ("show".equals(action)) {
				res = res + "_show";
				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				GrantShipApplication grantship = ((List<GrantShipApplication>)session.getAttribute("grantships")).get(id);
				System.out.println(grantship);
				session.setAttribute("ship", grantship);
			}else if("audit".equals(action)){
				User user = (Manager)session.getAttribute("user");
				try {
					AdminLogUtil.logAdminOperation(user.getId(), "审核"+type);
				} catch (Exception e) {
				}
				res = res + "_" + action;
				String status = request.getParameter("status");
				GrantShipApplication ship = (GrantShipApplication) session.getAttribute("ship");
				if (status != null && ship != null) {
					if (aduitScholarship(status, ship.getAppId())) {
						res = res + "_succeed";
					} else {
						res = res + "_failure";
					}
				}
			} else {
				String word = request.getParameter("word");
				List<GrantShipApplication> grantships = getGrantShipApplications(word);
				System.out.println(grantships);
				session.setAttribute("grantships", grantships);
			}
		}
		else if ("job".equals(type)) {
			if ("show".equals(action)) {
				res = res + "_show";
				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				JobApplication job = ((List<JobApplication>)session.getAttribute("jobs")).get(id);
				System.out.println(job);
				session.setAttribute("job", job);
			}else if("audit".equals(action)){
				res = res + "_" + action;
				String status = request.getParameter("status");
				JobApplication job = (JobApplication) session.getAttribute("job");
				System.out.println(status+":"+job);
				if (status != null && job != null) {
					if (aduitJob(status, job.getAppId())) {
						res = res + "_succeed";
					} else {
						res = res + "_failure";
					}
				}
			} else {
				String word = request.getParameter("word");
				List<JobApplication> jobs = getJobApplications(word);
				System.out.println(jobs);
				session.setAttribute("jobs", jobs);
			}
		}
		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/manager.jsp");
	}

	private boolean aduitJob(String status, int appId) {
		System.out.println("更改为：" + status);
		int check = 0;
		if ("true".equals(status)) {
			check = 1;
		} else if ("false".equals(status)) {
			check = 2;
		}
		return new ApplicationDaoImpl().updateApplication(appId, check);
	}

	private List<JobApplication> getJobApplications(String word) {
		return new ApplicationDaoImpl().getJobApplication(word);
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

	private List<GrantShipApplication> getGrantShipApplications(String word) {
		return new ApplicationDaoImpl().getGrantShipApplication(word);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
