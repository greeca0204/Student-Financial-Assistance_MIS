package com.slg.zxgl.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.JobDaoImpl;
import com.slg.zxgl.dao.impl.PoorinfoDaoImpl;
import com.slg.zxgl.dao.impl.SchoolInfoDaoImpl;
import com.slg.zxgl.dao.impl.StudentDaoImpl;
import com.slg.zxgl.dao.impl.TeacherDaoImpl;
import com.slg.zxgl.dao.impl.UserDaoImpl;
import com.slg.zxgl.db.AdminLogUtil;
import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.Job;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.Manager;
import com.slg.zxgl.entity.PoorStudentInfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.Teacher;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Manager.DeleteServlet", urlPatterns = { "/manager/delete.action" })
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("manager:delete.action");

		String type = request.getParameter("type");
		String action = request.getParameter("action");
		System.out.println("É¾³ý" + type);
		String res = "delete";

		if (type != null) {
			res = res + "_" + type;
		}
		System.out.println("É¾³ý" + type);
		// Ìø×ª
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();

		if ("search".equals(action) || action == null) {
			if ("class".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<ClassInfo> classs = null;
				if (word == null || "".equals(word)) {
					classs = getAllClassInfos();
				} else {
					classs = getClassInfosByWord(word);
				}
				System.out.println(classs);
				session.setAttribute("classs", classs);
			} else if ("major".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<MajorInfo> majors = null;
				if (word == null || "".equals(word)) {
					majors = getAllMajorInfos();
				} else {
					majors = getMajorInfosByWord(word);
				}
				System.out.println(majors);
				session.setAttribute("majors", majors);
			} else if ("grade".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<GradeInfo> grades = null;
				if (word == null || "".equals(word)) {
					grades = getAllGradeInfos();
				} else {
					grades = getGradeInfosByWord(word);
				}
				System.out.println(grades);
				session.setAttribute("grades", grades);
			} else if ("college".equals(type)) {
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
			} else if ("poorstu".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<PoorStudentInfo> poorstus = null;
				if (word == null || "".equals(word)) {
					poorstus = getAllPoorstus();
				} else {
					poorstus = getPoorstusByWord(word);
				}
				System.out.println(poorstus);
				session.setAttribute("poorstus", poorstus);
			} else if ("admin".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<Manager> admins = null;
				if (word == null || "".equals(word)) {
					admins = getAllAdmins();
				} else {
					admins = getAdminsByWord(word);
				}
				System.out.println(admins);
				session.setAttribute("admins", admins);
			} else if ("grantship".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<GrantShip> grantships = null;
				if (word == null || "".equals(word)) {
					grantships = getAllGrantShips();
				} else {
					grantships = getGrantShipsByWord(word);
				}
				System.out.println(grantships);
				session.setAttribute("grantships", grantships);
			} else if ("tea".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<Teacher> teas = null;
				if (word == null || "".equals(word)) {
					teas = getAllTeachers();
				} else {
					teas = getTeachersByWord(word);
				}
				System.out.println(teas);
				session.setAttribute("teas", teas);
			} else if ("job".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<Job> jobs = null;
				if (word == null || "".equals(word)) {
					jobs = getAllJobs();
				} else {
					jobs = getJobsByWord(word);
				}
				System.out.println(jobs);
				session.setAttribute("jobs", jobs);
			} else if ("stu".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("¹Ø¼ü×Ö£º" + word);
				List<Student> stus = null;
				if (word == null || "".equals(word)) {
					stus = getAllStudents();
				} else {
					stus = getStudentsByWord(word);
				}
				System.out.println(stus);
				session.setAttribute("stus", stus);
			}
		} else if ("delete".equals(action)) {
			User user = (Manager)session.getAttribute("user");
			try {
				AdminLogUtil.logAdminOperation(user.getId(), "É¾³ý"+type);
			} catch (Exception e) {
			}
			if ("major".equals(type)) {
				try {
					int majorid = Integer.parseInt(request.getParameter("majorid"));
					if (deleteMajor(majorid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("class".equals(type)) {
				try {
					int classid = Integer.parseInt(request.getParameter("classid"));
					if (deleteClass(classid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("grade".equals(type)) {
				try {
					int gradeid = Integer.parseInt(request.getParameter("gradeid"));
					if (deleteGrade(gradeid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("college".equals(type)) {
				try {
					int collegeid = Integer.parseInt(request.getParameter("collegeid"));
					if (deleteCollege(collegeid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("tea".equals(type)) {
				try {
					int teaid = Integer.parseInt(request.getParameter("teaid"));
					if (deleteTea(teaid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("admin".equals(type)) {
				try {
					int adminid = Integer.parseInt(request.getParameter("adminid"));
					if (deleteAdmin(adminid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("poorstu".equals(type)) {
				try {
					int stuid = Integer.parseInt(request.getParameter("stuid"));
					if (deletePoorInfo(stuid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("grantship".equals(type)) {
				try {
					int shipid = Integer.parseInt(request.getParameter("shipid"));
					if (deleteGrantShip(shipid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("job".equals(type)) {
				try {
					int jobid = Integer.parseInt(request.getParameter("jobid"));
					if (deleteJob(jobid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			} else if ("stu".equals(type)) {
				try {
					int stuid = Integer.parseInt(request.getParameter("stuid"));
					if (deleteStu(stuid)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					res += "_failure";
				}
			}
		}
		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/manager.jsp");
	}

	private boolean deleteClass(int classid) {
		return new SchoolInfoDaoImpl().deleteClass(classid);
	}

	private List<ClassInfo> getClassInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getClasss(word);
	}

	private List<ClassInfo> getAllClassInfos() {
		return getClassInfosByWord(null);
	}

	private List<MajorInfo> getMajorInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getMajors(word);
	}

	private List<MajorInfo> getAllMajorInfos() {
		return getMajorInfosByWord(null);
	}

	private boolean deleteMajor(int majorid) {
		return new SchoolInfoDaoImpl().deleteMajorInfo(majorid);
	}

	private List<GradeInfo> getGradeInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getGrades(null);
	}

	private List<GradeInfo> getAllGradeInfos() {
		return getGradeInfosByWord(null);
	}

	private boolean deleteGrade(int gradeid) {
		return new SchoolInfoDaoImpl().deleteGrade(gradeid);
	}

	private boolean deleteCollege(int collegeid) {
		return new SchoolInfoDaoImpl().deleteCollege(collegeid);
	}

	private List<CollegeInfo> getCollegeInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getColleges(word);
	}

	private List<CollegeInfo> getAllCollegeInfos() {
		return getCollegeInfosByWord(null);
	}

	private boolean deleteAdmin(int adminid) {
		return new UserDaoImpl().deleteAdmin(adminid);
	}

	private List<Manager> getAdminsByWord(String word) {
		return new UserDaoImpl().getAllAdmins(word);
	}

	private List<Manager> getAllAdmins() {
		return getAdminsByWord(null);
	}

	private List<Teacher> getTeachersByWord(String word) {
		return new TeacherDaoImpl().getTeachersByWord(null);
	}

	private List<Teacher> getAllTeachers() {
		return getTeachersByWord(null);
	}

	private boolean deleteTea(int teaid) {
		return new TeacherDaoImpl().deleteTeacher(teaid);
	}

	private boolean deleteStu(int stuid) {
		return new StudentDaoImpl().deleteStu(stuid);
	}

	private List<Student> getStudentsByWord(String word) {
		return new StudentDaoImpl().getStusByWord(word);
	}

	private List<Student> getAllStudents() {
		return getStudentsByWord(null);
	}

	private List<Job> getJobsByWord(String word) {
		return new JobDaoImpl().getJobsByWord(word);
	}

	private List<Job> getAllJobs() {
		return new JobDaoImpl().getAllJobs();
	}

	private boolean deleteJob(int jobid) {
		return new JobDaoImpl().deleteJob(jobid);
	}

	private boolean deleteGrantShip(int shipid) {
		return new SchoolInfoDaoImpl().deleteGrantShip(shipid);
	}

	private List<GrantShip> getGrantShipsByWord(String word) {
		return new SchoolInfoDaoImpl().getGrantShips(word);
	}

	private List<GrantShip> getAllGrantShips() {
		return getGrantShipsByWord(null);
	}

	private boolean deletePoorInfo(int stuid) {
		return new PoorinfoDaoImpl().deletePoorinfo(stuid);
	}

	private List<PoorStudentInfo> getPoorstusByWord(String word) {
		return new StudentDaoImpl().getPoorstusByWord(word);
	}

	private List<PoorStudentInfo> getAllPoorstus() {
		return getPoorstusByWord(null);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
