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
import com.slg.zxgl.dao.impl.MessageDaoImpl;
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
import com.slg.zxgl.entity.Message;
import com.slg.zxgl.entity.Poorinfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.StudentInfo;
import com.slg.zxgl.entity.Teacher;
import com.slg.zxgl.entity.User;

@WebServlet(name = "Manager.AddServlet", urlPatterns = { "/manager/add.action" })
public class AddServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("manager:add.action");
		request.setCharacterEncoding("UTF-8");
		// 跳转
		HttpServletRequest hreq = (HttpServletRequest) request;
		String path = hreq.getContextPath();
		String basePath = hreq.getScheme() + "://" + hreq.getServerName() + ":" + hreq.getServerPort() + path;
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String res = "add";
		if (type != null) {
			res = res + "_" + type;
		}
		String action = request.getParameter("action");
		User user = (Manager)session.getAttribute("user");
		System.out.println(type + ";" + action);
		if ("search".equals(action)) {
			String word = request.getParameter("word");
			if ("stu".equals(type)) {
				List<StudentInfo> stus = getStudentsByWord(word);
				System.out.println(stus);
				session.setAttribute("stus", stus);
			} else if ("poorstu".equals(type)) {
				List<StudentInfo> stus = getNotPoorByWord(word);
				System.out.println(stus);
				session.setAttribute("stus", stus);
			}
		} else if ("show".equals(action)) {
			res = res + "_" + action;
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				Object show = ((List<?>) session.getAttribute(type + "s")).get(id);
				System.out.println(show.getClass());
				session.setAttribute("show", show);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("add".equals(action)) {
			res = res + "_" + action;
			try {
				AdminLogUtil.logAdminOperation(user.getId(), "添加"+type);
			} catch (Exception e) {
			}
			if ("class".equals(type)) {
				/**
				 * name=&shortname=&description=&collegeid=&majorid=&gradeid=
				 */
				try {
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					int gradeid = Integer.parseInt(request.getParameter("gradeid"));
					int collegeid = Integer.parseInt(request.getParameter("collegeid"));
					int majorid = Integer.parseInt(request.getParameter("majorid"));
					ClassInfo info = new ClassInfo(0, name, shortname, description, gradeid, null, collegeid, null,
							majorid, null);
					if (addClass(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("major".equals(type)) {
				try {
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					MajorInfo info = new MajorInfo(0, name, shortname, description);
					if (addMajor(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("college".equals(type)) {
				try {
					String name = request.getParameter("name");
					String shortname = request.getParameter("shortname");
					String description = request.getParameter("description");
					CollegeInfo info = new CollegeInfo(0, name, shortname, description);
					if (addCollege(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("grade".equals(type)) {
				try {
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					GradeInfo info = new GradeInfo(0, name, description);
					if (addGrade(info)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("grantship".equals(type)) {
				try {
					// type=grantship&action=add&name=&req=&number=&money=&stype=
					String name = request.getParameter("name");
					String req = request.getParameter("req");
					double money = Double.parseDouble(request.getParameter("money"));
					String number = request.getParameter("number");
					String stype = request.getParameter("stype");
					System.out.println(name + ":" + req + ":" + money + ":" + number + "stype");
					GrantShip ship = new GrantShip(0, name, money, req, number,
							new java.sql.Timestamp(System.currentTimeMillis()), stype, true);
					if (addGrantShip(ship)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("tea".equals(type)) {
				try {
					/**
					 * accname=123&name=123&email=123&phone=123&department=123&
					 * position=123&positiontitle=123&classid=0
					 */
					String name = request.getParameter("name");
					String accname = request.getParameter("accname");
					String email = request.getParameter("email");
					String phone = request.getParameter("phone");
					String department = request.getParameter("department");
					String position = request.getParameter("position");
					String positiontitle = request.getParameter("positiontitle");
					int classid = Integer.parseInt(request.getParameter("classid"));
					String className = new SchoolInfoDaoImpl().getClassNameBy(classid);
					Teacher tea = new Teacher(0, accname, null, 2, name, classid, className, department, position,
							positiontitle, phone, email);
					if (addTeacher(tea)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("admin".equals(type)) {
				try {
					/**
					 * accname=admin&name=123&permission=1
					 */
					String name = request.getParameter("name");
					String accname = request.getParameter("accname");
					int permission = Integer.parseInt(request.getParameter("permission"));
					Manager m = new Manager(0, accname, null, 0, name, permission);
					if (addManager(m)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("job".equals(type)) {
				try {
					/**
					 * type=job&action=add&name=123&skills=123&employer=123&
					 * allNumber=123&workpoint=123&worktime=123&interview=123
					 */
					String name = request.getParameter("name");
					int allNumber = Integer.parseInt(request.getParameter("allNumber"));
					String skills = request.getParameter("skills");
					String employer = request.getParameter("employer");
					String workpoint = request.getParameter("workpoint");
					String worktime = request.getParameter("worktime");
					String interview = request.getParameter("interview");
					Job job = new Job(0, name, allNumber, worktime, workpoint, skills, interview,
							new java.sql.Timestamp(System.currentTimeMillis()), employer, true);
					System.out.println(job);
					if (addJob(job)) {
						res += "_succeed";
					} else {
						res += "_failure";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("poorstu".equals(type)) {
				boolean flg = false;
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					Object show = ((List<?>) session.getAttribute("stus")).get(id);
					System.out.println(show.getClass());
					session.setAttribute("show", show);
				} catch (Exception e) {
					flg = true;
				}

				if (flg) {
					try {
						int stuid = Integer.parseInt(request.getParameter("stuid"));
						int poorgrade = Integer.parseInt(request.getParameter("poorgrade"));
						double homeincome = Double.parseDouble(request.getParameter("homeincome"));
						int homepeople = Integer.parseInt(request.getParameter("homepeople"));
						System.out.println(stuid + ":" + poorgrade + ":" + homeincome + ":" + homepeople);
						Poorinfo info = new Poorinfo(0, stuid, homepeople, homeincome, poorgrade);
						System.out.println(info);
						if (addPoorInfo(info)) {
							res += "_succeed";
						} else {
							res += "_failure";
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} else if ("stu".equals(type)) {
				System.out.println("添加学额生信息");
				/**
				 * ?accname=&name=&gender=M&politicsstatus=&nationality=&
				 * phone=&identification=&address=&classid=1 =add
				 */
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
				Student stu = new Student(0, accname, null, 1, name, gender, politicsStatus, nationality,
						identification, phone, address, classid, classname, false);
				if (addStu(stu)) {
					res += "_succeed";
				} else {
					res += "_failure";
				}
			} else if ("info".equals(type)) {
				System.out.println("添加通知生信息");
				Message info;
				int type1 = -1;
				int target = -1;
				/**
				 * title=1&details=1&type=1&target=1
				 */
				try {
					String title = request.getParameter("title");
					String details = request.getParameter("details");
					System.out.println(request.getParameter("usertype"));
					System.out.println(request.getParameter("target"));
					type1 = Integer.parseInt(request.getParameter("usertype"));
					target = Integer.parseInt(request.getParameter("target"));
					info = new Message(0, title, details, new java.sql.Timestamp(System.currentTimeMillis()));

				} catch (Exception e) {
					e.printStackTrace();
					info = null;
				}
				if (addInfo(info, type1, target)) {
					res += "_succeed";
				} else {
					res += "_failure";
				}
			}
		} else if ("return".equals(action)) {
			res = "add_" + type;
		} else if (action == null) {
			Map<Integer, String> cs = getClassNameId();
			session.setAttribute("cs", cs);
			Map<Integer, String> cos = getCollegeNameId();
			session.setAttribute("cos", cos);
			Map<Integer, String> gs = getGradeNameId();
			session.setAttribute("gs", gs);
			Map<Integer, String> ms = getMajorNameId();
			session.setAttribute("ms", ms);
			Map<Integer, String> stuIds = getStuNameId();
			session.setAttribute("stuids", stuIds);
			Map<Integer, String> teaIds = getTeaNameId();
			session.setAttribute("teaids", teaIds);
		}

		System.out.println(res);
		session.setAttribute("result", res);
		response.sendRedirect(basePath + "/manager.jsp");
	}

	private boolean addClass(ClassInfo info) {
		return new SchoolInfoDaoImpl().addClassInfo(info);
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

	private boolean addMajor(MajorInfo info) {
		return new SchoolInfoDaoImpl().addMajorInfo(info);
	}

	private boolean addGrade(GradeInfo info) {
		return new SchoolInfoDaoImpl().addGradeInfo(info);
	}

	private boolean addCollege(CollegeInfo info) {
		return new SchoolInfoDaoImpl().addCollegeInfo(info);
	}

	private boolean addManager(Manager m) {
		return new UserDaoImpl().addManager(m);
	}

	private boolean addTeacher(Teacher tea) {
		return new TeacherDaoImpl().addTea(tea);
	}

	private boolean addInfo(Message info, int type, int target) {
		if (info != null && type != -1 && target != -1) {
			return new MessageDaoImpl().addMessage(info, type, target);
		} else {
			return false;
		}
	}

	private Map<Integer, String> getTeaNameId() {
		return new SchoolInfoDaoImpl().getTeaNameId();
	}

	private Map<Integer, String> getStuNameId() {
		return new SchoolInfoDaoImpl().getStuNameId();
	}

	private boolean addStu(Student stu) {
		return new StudentDaoImpl().addStu(stu);
	}

	private Map<Integer, String> getClassNameId() {
		return new SchoolInfoDaoImpl().getClassNameId();
	}

	private boolean addJob(Job job) {
		return new JobDaoImpl().addJob(job);
	}

	private boolean addGrantShip(GrantShip ship) {
		return new SchoolInfoDaoImpl().addGrantShip(ship);
	}

	private boolean addPoorInfo(Poorinfo info) {
		return new PoorinfoDaoImpl().addPoorinfo(info);
	}

	private List<StudentInfo> getNotPoorByWord(String word) {
		if (word != null) {
			return new StudentDaoImpl().getNotPoorByWord(word);
		} else {
			return new StudentDaoImpl().getAllNotPoor();
		}
	}

	private List<StudentInfo> getStudentsByWord(String word) {
		if (word != null) {
			return new StudentDaoImpl().getStudentsByWord(word);
		} else {
			return new StudentDaoImpl().getAllStudents();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
