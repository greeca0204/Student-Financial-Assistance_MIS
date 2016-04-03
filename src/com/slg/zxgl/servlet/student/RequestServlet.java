package com.slg.zxgl.servlet.student;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.slg.zxgl.dao.impl.ApplicationDaoImpl;
import com.slg.zxgl.dao.impl.JobDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.ScholarShip;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Student.RequestServlet", urlPatterns = { "/student/request.action" })
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("student:request.action");
		request.setCharacterEncoding("UTF-8");

		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		System.out.println("请求" + type);
		String res = "request";
		String action = request.getParameter("action");
		if (type != null) {
			res = res + "_" + type;
		}
		if (action != null) {
			res = res + "_" + action;
		}
		System.out.println("请求:" + type + ";" + action);

		if ("add".equals(action)) {
			int id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch (Exception e) {
				id = 0;
			}

			if ("job".equals(type)) {
				// 提交job申请
				Job job = getJobById(id);
				System.out.println(job);
				session.setAttribute("job", job);

			} else if ("grantship".equals(type)) {
				// 提交grantship申请
				GrantShip grantship = getGrantShipById(id);
				System.out.println(grantship);
				session.setAttribute("grantship", grantship);
			} else if ("scholarship".equals(type)) {
				// 提交scholarship申请
				ScholarShip scholarship = getScholarShipById(id);
				System.out.println(scholarship);
				session.setAttribute("scholarship", scholarship);
			}
		} else if ("add_req".equals(action)) {
			if (((User) session.getAttribute("user")) != null) {
				int requestid = 0;
				int stuid = ((User) session.getAttribute("user")).getId();
				type = request.getParameter("type");
				int type1 = 0;
				if ("job".equals(type)) {
					type1 = 2;
				} else if ("grantship".equals(type)) {
					type1 = 1;
				} else if ("scholarship".equals(type)) {
					type1 = 0;
				}
				try {
					requestid = Integer.parseInt(request.getParameter("requestid"));
				} catch (Exception e) {
					requestid = 0;
				}
				System.out.println(requestid + "," + type1 + "," + stuid);
				if (requestid != 0 && stuid != 0) {
					if (addApplication(requestid, stuid, type1)) {
						res+="_succeed";
					}else{
						res+="_faliure";
					}
				}
			}
		} else {
			if ("job".equals(type)) {
				String word = request.getParameter("word");
				List<Job> jobs = null;
				if ("".equals(word) || word == null) {
					// 查询可以申请的jobs
					jobs = getJobs();
				} else {
					jobs = getSearchJobs(word);
				}
				System.out.println(jobs);
				session.setAttribute("jobs", jobs);
			} else if ("scholarship".equals(type)) {
				// 查询可以申请的scholarships
				List<ScholarShip> scholarships = null;
				String word = request.getParameter("word");
				if ("".equals(word) || word == null) {
					// 查询可以申请的jobs
					scholarships = getScholarShips();
				} else {
					scholarships = getSearchScholarShips(word);
				}
				System.out.println(scholarships);
				session.setAttribute("scholarships", scholarships);

			} else if ("grantship".equals(type)) {
				// 查询可以申请的grantships
				List<GrantShip> grantships = null;
				String word = request.getParameter("word");
				if ("".equals(word) || word == null) {
					// 查询可以申请的jobs
					grantships = getGrantShips();
				} else {
					grantships = getSearchGrantShips(word);
				}
				System.out.println(grantships);
				session.setAttribute("grantships", grantships);

			}

		}
		session.setAttribute("result", res);
		System.out.println(res);
		response.sendRedirect(basePath + "/student.jsp");
	}

	private GrantShip getGrantShipById(int id) {
		return new SchoolInfoDaoImpl().getGrantShipById(id);
	}

	private ScholarShip getScholarShipById(int id) {
		return new SchoolInfoDaoImpl().getScholarShipById(id);
	}

	private List<ScholarShip> getSearchScholarShips(String word) {
		return new JobDaoImpl().getScholarShipByWord(word);
	}

	private List<GrantShip> getSearchGrantShips(String word) {
		return new JobDaoImpl().getGrantShipByWord(word);
	}

	private List<Job> getSearchJobs(String word) {
		return new JobDaoImpl().getJobsByWord(word);
	}

	private boolean addApplication(int requestid, int stuid, int type) {
		return new ApplicationDaoImpl().addApplication(requestid, stuid, type);
	}

	private Job getJobById(int id) {
		return new JobDaoImpl().getJobById(id);
	}

	private List<GrantShip> getGrantShips() {
		return new SchoolInfoDaoImpl().getGrantShips(null);
	}

	private List<ScholarShip> getScholarShips() {
		return new SchoolInfoDaoImpl().getScholarShips();
	}

	private List<Job> getJobs() {
		return new JobDaoImpl().getAllJobs();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
