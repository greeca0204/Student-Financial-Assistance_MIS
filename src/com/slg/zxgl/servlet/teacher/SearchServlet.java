package com.slg.zxgl.servlet.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.MessageDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;
import com.slg.zxgl.dao.impl.StudentDaoImpl;
import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.Message;
import com.slg.zxgl.entity.StudentInfo;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Teacher.SearchServlet", urlPatterns = { "/teacher/search.action" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("teacher:search.action");
		request.setCharacterEncoding("UTF-8");
		// Ìø×ª
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		System.out.println("²éÑ¯:" + type);
		String res = "search";
		User user = (User) session.getAttribute("user");
		if (user != null) {
			if (type != null) {
				res = res + "_" + type;
			}

			if ("stu".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<StudentInfo> stus = null;
				if (word == null || "".equals(word)) {
					stus = getAllStudents();
				} else {
					stus = getStudentsByWord(word);
				}

				session.setAttribute("stus", stus);
			} else if ("info".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<Message> infos = null;
				if (word == null || "".equals(word)) {
					infos = getAllInfos(user.getUserType());
				} else {
					infos = getInfosByWord(user.getUserType(), word);
				}
				System.out.println(infos);
				session.setAttribute("infos", infos);
			}else if ("college".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<CollegeInfo> colleges = null;
				if (word == null || "".equals(word)) {
					colleges = getAllCollegeInfos();
				} else {
					colleges = getCollegeInfosByWord(word);
				}
				System.out.println(colleges);
				session.setAttribute("colleges", colleges);
			}else if ("class".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<ClassInfo> infos = null;
				if (word == null || "".equals(word)) {
					infos = getClasss();
				} else {
					infos = getClasssByWord(word);
				}
				System.out.println(infos);
				session.setAttribute("classs", infos);
			}else if ("grade".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<GradeInfo> grades = null;
				if (word == null || "".equals(word)) {
					grades = getAllGrades();
				} else {
					grades = getGradesByWord( word);
				}
				System.out.println(grades);
				session.setAttribute("grades", grades);
			}else if ("major".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<MajorInfo> majors = null;
				if (word == null || "".equals(word)) {
					majors = getAllMajors();
				} else {
					majors = getMajorsByWord(word);
				}
				System.out.println(majors);
				session.setAttribute("majors", majors);
			}

			System.out.println(res);
			session.setAttribute("result", res);
			response.sendRedirect(basePath + "/teacher.jsp");
		}
		else{
			response.sendRedirect(basePath + "/index.jsp");
			
		}
	}

	private List<MajorInfo> getMajorsByWord(String word) {
		return new SchoolInfoDaoImpl().getMajors(word);
	}

	private List<MajorInfo> getAllMajors() {
		return new SchoolInfoDaoImpl().getMajors(null);
	}

	private List<GradeInfo> getGradesByWord(String word) {
		return new SchoolInfoDaoImpl().getGrades(word);
	}

	private List<GradeInfo> getAllGrades() {
		return new SchoolInfoDaoImpl().getGrades(null);
	}

	private List<ClassInfo> getClasssByWord(String word) {
		return new SchoolInfoDaoImpl().getClasss(word);
	}

	private List<ClassInfo> getClasss() {
		return new SchoolInfoDaoImpl().getClasss(null);
	}

	private List<CollegeInfo> getCollegeInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getColleges(word);
	}

	private List<CollegeInfo> getAllCollegeInfos() {
		return new SchoolInfoDaoImpl().getColleges(null);
	}

	private List<Message> getInfosByWord(int userType, String word) {
		return new MessageDaoImpl().getMessageByWord(userType, word);
	}

	private List<Message> getAllInfos(int userType) {
		return new MessageDaoImpl().getAllMessages(userType, 0);
	}

	private List<StudentInfo> getStudentsByWord(String word) {
		return new StudentDaoImpl().getStudentsByWord(word);
	}

	private List<StudentInfo> getAllStudents() {
		return new StudentDaoImpl().getAllStudents();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
