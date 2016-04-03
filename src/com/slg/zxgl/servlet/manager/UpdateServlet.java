package com.slg.zxgl.servlet.manager;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import com.slg.zxgl.entity.Poorinfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.Teacher;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Manager.UpdateServlet", urlPatterns = { "/manager/update.action" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("manager:update.action");
		request.setCharacterEncoding("UTF-8");
		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String action = request.getParameter("action");
		System.out.println("修改" + type + ";" + action);
		String res = "update";
		if (type != null) {
			res = res + "_" + type;
		}
		if ("search".equals(action) || action == null) {
			if ("class".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
				List<Manager> admins = null;
				if (word == null || "".equals(word)) {
					admins = getAllAdmins();
				} else {
					admins = getAdminsByWord(word);
				}
				System.out.println(admins);
				session.setAttribute("admins", admins);
			} else if ("stu".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("关键字：" + word);
				List<Student> stus = null;
				if (word == null || "".equals(word)) {
					stus = getAllStus();
				} else {
					stus = getStusByWord(word);
				}
				System.out.println(stus);
				session.setAttribute("stus", stus);
			} else if ("grantship".equals(type)) {
				String word = request.getParameter("word");
				System.out.println("关键字：" + word);
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
				System.out.println("关键字：" + word);
				List<Teacher> teas = null;
				if (word == null || "".equals(word)) {
					teas = getAllTeachers();
				} else {
					teas = getTeachersByWord(word);
				}
				System.out.println(teas);
				session.setAttribute("teas", teas);
			}
		} else if ("show".equals(action)) {
			res += "_show";
			if ("major".equals(type)) {
				try {
					int majorid = Integer.parseInt(request.getParameter("majorid"));
					System.out.println("更新学院id" + majorid);
					MajorInfo major = getMajorInfo(majorid);
					System.out.println(major);
					session.setAttribute("show", major);
				} catch (Exception e) {
				}
			} else if ("class".equals(type)) {
				try {
					int classid = Integer.parseInt(request.getParameter("classid"));
					System.out.println("更新专业id" + classid);
					ClassInfo cls = getClassInfo(classid);
					System.out.println(cls);
					session.setAttribute("show", cls);
					Map<Integer, String> cos = getCollegeNameId();
					session.setAttribute("cos", cos);
					Map<Integer, String> gs = getGradeNameId();
					session.setAttribute("gs", gs);
					Map<Integer, String> ms = getMajorNameId();
					session.setAttribute("ms", ms);
				} catch (Exception e) {
				}
			} else if ("grade".equals(type)) {
				try {
					int gradeid = Integer.parseInt(request.getParameter("gradeid"));
					System.out.println("更新学院id" + gradeid);
					GradeInfo grade = getGradeInfo(gradeid);
					System.out.println(grade);
					session.setAttribute("show", grade);
				} catch (Exception e) {
				}
			} else if ("college".equals(type)) {
				try {
					int collegeid = Integer.parseInt(request.getParameter("collegeid"));
					System.out.println("更新学院id" + collegeid);
					CollegeInfo college = getCollegeInfo(collegeid);
					System.out.println(college);
					session.setAttribute("show", college);
				} catch (Exception e) {
				}
			} else if ("poorstu".equals(type)) {
				try {
					int stuid = Integer.parseInt(request.getParameter("stuid"));
					System.out.println("更新学生id" + stuid);
					PoorStudentInfo poorstu = getPoorStudentInfo(stuid);
					System.out.println(poorstu);
					session.setAttribute("show", poorstu);
				} catch (Exception e) {
				}
			} else if ("admin".equals(type)) {
				try {
					int adminid = Integer.parseInt(request.getParameter("adminid"));
					System.out.println("管理员id" + adminid);
					Manager admin = getManager(adminid);
					System.out.println(admin);
					session.setAttribute("show", admin);
				} catch (Exception e) {
				}
			} else if ("stu".equals(type)) {
				try {
					int stuid = Integer.parseInt(request.getParameter("stuid"));
					System.out.println("更新学生id" + stuid);
					Student stu = getStudent(stuid);
					System.out.println(stu);
					Map<Integer, String> cs = getClassNameId();
					session.setAttribute("cs", cs);
					session.setAttribute("show", stu);
				} catch (Exception e) {
				}
			} else if ("grantship".equals(type)) {
				System.out.println("update:grantship:show");
				int id = Integer.parseInt(request.getParameter("id"));
				System.out.println("更新助学金id" + id);
				GrantShip grantship = getGrantShip(id);
				System.out.println(grantship);
				session.setAttribute("show", grantship);
			} else if ("job".equals(type)) {
				System.out.println("update:job:show");
				int id = Integer.parseInt(request.getParameter("id"));
				System.out.println("更新岗位id" + id);
				Job job = getJob(id);
				System.out.println(job);
				session.setAttribute("show", job);
			} else if ("tea".equals(type)) {
				System.out.println("update:tea:show");
				int id = Integer.parseInt(request.getParameter("id"));
				System.out.println("更新岗位id" + id);
				Teacher tea = getTea(id);
				System.out.println(tea);
				Map<Integer, String> cs = getClassNameId();
				session.setAttribute("cs", cs);
				session.setAttribute("show", tea);
			}
		} else if ("return".equals(action)) {
			res = "update_" + type;
		} else if ("update".equals(action)) {
			res += "_" + action;
			try {
				User user = (Manager) session.getAttribute("user");
				AdminLogUtil.logAdminOperation(user.getId(), "更改" + type);
			} catch (Exception e) {
			}
			if ("major".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					// type=grantship&action=add&name=&req=&number=&money=&stype=
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					MajorInfo info = new MajorInfo(id, name, shortname, description);
					if (updateMajorInfo(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("class".equals(type)) {
				/**
				 * name=asd&shortname=asd&description=asd&collegeid=1&majorid=1&
				 * gradeid=1&classid=2
				 */
				try {
					int classid = Integer.parseInt(request.getParameter("classid"));
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					int collegeid = Integer.parseInt(request.getParameter("collegeid"));
					int majorid = Integer.parseInt(request.getParameter("majorid"));
					int gradeid = Integer.parseInt(request.getParameter("gradeid"));
					ClassInfo info = new ClassInfo(classid, name, shortname, description, gradeid, null, collegeid,
							null, majorid, null);
					if (updateClassInfo(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("grade".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					// type=grantship&action=add&name=&req=&number=&money=&stype=
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					GradeInfo info = new GradeInfo(id, name, description);
					if (updateGradeInfo(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("college".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					// type=grantship&action=add&name=&req=&number=&money=&stype=
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					CollegeInfo info = new CollegeInfo(id, name, shortname, description);
					if (updateCollegeInfo(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("poorstu".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					int poorgrade = Integer.parseInt(request.getParameter("poorgrade"));
					double homeincome = Double.parseDouble(request.getParameter("homeincome"));
					int homepeople = Integer.parseInt(request.getParameter("homepeople"));
					System.out.println(id + ":" + poorgrade + ":" + homeincome + ":" + homepeople);
					Poorinfo info = new Poorinfo(id, 0, homepeople, homeincome, poorgrade);
					if (updatePoorInfo(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("admin".equals(type)) {
				try {
					/**
					 * id=4&accname=zhuxue&name=助学&permission=4
					 */
					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String accname = request.getParameter("accname");
					int permission = Integer.parseInt(request.getParameter("permission"));
					Manager m = new Manager(id, accname, null, 0, name, permission);
					if (updateManager(m)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("tea".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String accname = request.getParameter("accname");
					String email = request.getParameter("email");
					String phone = request.getParameter("phone");
					String department = request.getParameter("department");
					String position = request.getParameter("position");
					String positiontitle = request.getParameter("positiontitle");
					int classid = Integer.parseInt(request.getParameter("classid"));
					String className = new SchoolInfoDaoImpl().getClassNameBy(classid);
					Teacher tea = new Teacher(id, accname, null, 2, name, classid, className, department, position,
							positiontitle, phone, email);
					if (updateTeacher(tea)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("stu".equals(type)) {
				try {
					int id = Integer.parseInt(request.getParameter("stuid"));
					String accname = request.getParameter("accname");
					String name = request.getParameter("name");
					String gender = request.getParameter("gender");
					String politicsStatus = request.getParameter("politicsstatus");
					String nationality = request.getParameter("nationality");
					String identification = request.getParameter("identification");
					String address = request.getParameter("address");
					String phone = request.getParameter("phone");
					int classid = 0;
					try {
						classid = Integer.parseInt(request.getParameter("classid"));
					} catch (Exception e) {
						classid = 0;
					}
					String classname = new SchoolInfoDaoImpl().getClassNameBy(classid);
					Student stu = new Student(id, accname, null, 1, name, gender, politicsStatus, nationality,
							identification, phone, address, classid, classname, false);
					if (updateStu(stu)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("grantship".equals(type)) {
				System.out.println("update:grantship:update");
				try {
					/**
					 * name=123&req=123&number=123&money=123.0&stype=123&id=8&
					 * type=grantship&action=update
					 */
					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String req = request.getParameter("req");
					double money = Double.parseDouble(request.getParameter("money"));
					String number = request.getParameter("number");
					String stype = request.getParameter("stype");
					System.out.println(id + ":" + name + ":" + req + ":" + money + ":" + number + ":" + stype);
					GrantShip ship = new GrantShip(id, name, money, req, number,
							new java.sql.Timestamp(System.currentTimeMillis()), stype, true);
					if (updateGrantShip(ship)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			} else if ("job".equals(type)) {
				System.out.println("update:job:update");
				try {
					/**
					 * name=java工程师&skills=熟悉JAVA&employer=恒电&allNumber=10&
					 * workpoint=广州&worktime=早上8：30-晚上6：00，中午休息1个钟，&interview=
					 * 12月12日前&id=1&type=job&action=update
					 */
					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					int allNumber = Integer.parseInt(request.getParameter("allNumber"));
					String skills = request.getParameter("skills");
					String employer = request.getParameter("employer");
					String workpoint = request.getParameter("workpoint");
					String worktime = request.getParameter("worktime");
					String interview = request.getParameter("interview");
					Job job = new Job(id, name, allNumber, worktime, workpoint, skills, interview, null, employer,
							true);
					if (updateJob(job)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
					res += "_failure";
				}
			}
		}
		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/manager.jsp");
	}

	private boolean updateClassInfo(ClassInfo info) {
		return new SchoolInfoDaoImpl().updateClassInfo(info);
	}

	private List<ClassInfo> getClassInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getClasss(word);
	}

	private List<ClassInfo> getAllClassInfos() {
		return getClassInfosByWord(null);
	}

	private ClassInfo getClassInfo(int classid) {
		return new SchoolInfoDaoImpl().getClassInfoById(classid);
	}

	private boolean updateMajorInfo(MajorInfo info) {
		return new SchoolInfoDaoImpl().updateMajorInfo(info);
	}

	private MajorInfo getMajorInfo(int id) {
		return new SchoolInfoDaoImpl().getMajorInfoById(id);
	}

	private List<MajorInfo> getMajorInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getMajors(word);
	}

	private List<MajorInfo> getAllMajorInfos() {
		return getMajorInfosByWord(null);
	}

	private List<GradeInfo> getGradeInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getGrades(word);
	}

	private List<GradeInfo> getAllGradeInfos() {
		return getGradeInfosByWord(null);
	}

	private boolean updateGradeInfo(GradeInfo info) {
		return new SchoolInfoDaoImpl().updateGradeInfo(info);
	}

	private GradeInfo getGradeInfo(int gradeid) {
		return new SchoolInfoDaoImpl().getGradeInfoById(gradeid);
	}

	private boolean updateCollegeInfo(CollegeInfo info) {
		return new SchoolInfoDaoImpl().updateCollegeInfo(info);
	}

	private CollegeInfo getCollegeInfo(int collegeid) {
		return new SchoolInfoDaoImpl().getCollegeInfoById(collegeid);
	}

	private List<CollegeInfo> getCollegeInfosByWord(String word) {
		return new SchoolInfoDaoImpl().getColleges(word);
	}

	private List<CollegeInfo> getAllCollegeInfos() {
		return getCollegeInfosByWord(null);
	}

	private boolean updateManager(Manager m) {
		return new UserDaoImpl().updateAdmin(m);
	}

	private List<Manager> getAdminsByWord(String word) {
		return new UserDaoImpl().getAllAdmins(word);
	}

	private List<Manager> getAllAdmins() {
		return getAdminsByWord(null);
	}

	private Manager getManager(int adminid) {
		return new UserDaoImpl().getAdminById(adminid);
	}

	private List<Teacher> getTeachersByWord(String word) {
		return new TeacherDaoImpl().getTeachersByWord(word);
	}

	private List<Teacher> getAllTeachers() {
		return getTeachersByWord(null);
	}

	private Teacher getTea(int id) {
		return new TeacherDaoImpl().getTeacherById(id);
	}

	private boolean updateTeacher(Teacher tea) {
		return new TeacherDaoImpl().updateTeacher(tea);
	}

	private boolean updateStu(Student stu) {
		return new StudentDaoImpl().updateStu(stu);
	}

	private Student getStudent(int stuid) {
		return new StudentDaoImpl().getStudent(stuid);
	}

	private List<Student> getStusByWord(String word) {
		return new StudentDaoImpl().getStusByWord(word);
	}

	private List<Student> getAllStus() {
		return getStusByWord(null);
	}

	private Job getJob(int id) {
		return new JobDaoImpl().getJobById(id);
	}

	private boolean updateJob(Job job) {
		return new JobDaoImpl().updateJob(job);
	}

	private boolean updateGrantShip(GrantShip ship) {
		return new SchoolInfoDaoImpl().updateGrantShip(ship);
	}

	private GrantShip getGrantShip(int id) {
		return new SchoolInfoDaoImpl().getGrantShipById(id);
	}

	private List<GrantShip> getGrantShipsByWord(String word) {
		return new SchoolInfoDaoImpl().getGrantShips(word);
	}

	private List<GrantShip> getAllGrantShips() {
		return getGrantShipsByWord(null);
	}

	private boolean updatePoorInfo(Poorinfo info) {
		return new PoorinfoDaoImpl().updatePoorinfo(info);
	}

	private PoorStudentInfo getPoorStudentInfo(int stuid) {
		return new StudentDaoImpl().getPoorstusByStuId(stuid);
	}

	private List<PoorStudentInfo> getPoorstusByWord(String word) {
		return new StudentDaoImpl().getPoorstusByWord(word);
	}

	private List<PoorStudentInfo> getAllPoorstus() {
		return getPoorstusByWord(null);
	}

	private Map<Integer, String> getClassNameId() {
		return new SchoolInfoDaoImpl().getClassNameId();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private Map<Integer, String> getMajorNameId() {
		return new SchoolInfoDaoImpl().getMajorNameId();
	}

	private Map<Integer, String> getGradeNameId() {
		return new SchoolInfoDaoImpl().getGradeNameId();
	}

	private Map<Integer, String> getCollegeNameId() {
		return new SchoolInfoDaoImpl().getCollegeNameId();
	}

}
