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
import com.slg.zxgl.dao.impl.MessageDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;
import com.slg.zxgl.entity.ApplicationInfo;
import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.Message;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Student.SearchServlet", urlPatterns = { "/student/search.action" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("student:search.action");

		// Ìø×ª
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String action = request.getParameter("type");
		String res = "search";
		if (action != null) {
			res = res + "_" + action;
		}
		System.out.println("ËÑË÷" + res);
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			if ("info".equals(action)) {
				List<Message> msgs = getMessages(user.getUserType(), 0);
				session.setAttribute("msgs", msgs);
			} else if ("class".equals(action)) {
				List<ClassInfo> classs = getClasss();
				System.out.println(classs);
				session.setAttribute("classs", classs);
			} else if("college".equals(action)){
				List<CollegeInfo> colleges = getColleges();
				System.out.println(colleges);
				session.setAttribute("colleges", colleges);
			} else if("major".equals(action)){
				List<MajorInfo> majors = getMajors();
				System.out.println(majors);
				session.setAttribute("majors", majors);
			}else if("grade".equals(action)){
				List<GradeInfo> grades = getGrades();
				System.out.println(grades);
				session.setAttribute("grades", grades);
			}else if("job".equals(action)){
				List<Job> grades = getJobs();
				System.out.println(grades);
				session.setAttribute("grades", grades);
			}else if("scholarship".equals(action)){
				List<ApplicationInfo> apps = getApplications("scholarship",user.getId());
				System.out.println(apps);
				session.setAttribute("appliactions", apps);
			}else if("grantship".equals(action)){
				List<ApplicationInfo> apps = getApplications("grantship",user.getId());
				System.out.println(apps);
				session.setAttribute("appliactions", apps);
			}else if("reqjob".equals(action)){
				List<ApplicationInfo> apps = getApplications("job",user.getId());
				System.out.println(apps);
				session.setAttribute("appliactions", apps);
			}
		}
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/student.jsp");

	}

	private List<ApplicationInfo> getApplications(String type,int stuid) {
		if("scholarship".equals(type)){
			return new ApplicationDaoImpl().getScholarShips(stuid);
		}else  if("grantship".equals(type)){
			return new ApplicationDaoImpl().getGrantShips(stuid);
		}else  if("job".equals(type)){
			return new ApplicationDaoImpl().getJobs(stuid);
		}
		return null;
	}

	private List<Job> getJobs() {
		return new JobDaoImpl().getAllJobs();
	}

	private List<GradeInfo> getGrades() {
		return new SchoolInfoDaoImpl().getGrades(null);
	}

	private List<MajorInfo> getMajors() {
		return new SchoolInfoDaoImpl().getMajors(null);
	}

	private List<CollegeInfo> getColleges() {
		return new SchoolInfoDaoImpl().getColleges(null);
	}

	private List<ClassInfo> getClasss() {
		return new SchoolInfoDaoImpl().getClasss(null);
	}

	private List<Message> getMessages(int usertype, int userid) {

		return new MessageDaoImpl().getAllMessages(usertype, userid);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
