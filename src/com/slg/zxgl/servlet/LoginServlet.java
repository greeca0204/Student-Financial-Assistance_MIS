package com.slg.zxgl.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.slg.zxgl.dao.impl.MessageDaoImpl;
import com.slg.zxgl.dao.impl.UserDaoImpl;
import com.slg.zxgl.db.AdminLogUtil;
import com.slg.zxgl.entity.Message;
import com.slg.zxgl.entity.User;

@WebServlet("/login.action")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int userType = Integer.parseInt(request.getParameter("userType"));
		// System.out.println("username:"+username+";password:"+password+";usertype="+userType);
		HttpSession session = request.getSession();
		User user = getUser(username, password, userType);
		session.setAttribute("user", user);
		session.setAttribute("result", "login");
		String page = "index.jsp";
		if (user != null) {
			List<Message> msgs = new MessageDaoImpl().getAllMessages(user.getUserType(), 0);
			List<Message> mymsgs = new MessageDaoImpl().getAllMessages(user.getUserType(), user.getId());
			session.setAttribute("msgs", msgs);
			session.setAttribute("mymsgs", mymsgs);
			switch (user.getUserType()) {
			case 0:
				page = "manager.jsp";
				String ip = request.getHeader("x-forwarded-for");
				if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
				}
				if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
				}
				if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
				}
				AdminLogUtil.logAdminOperation(user.getId(), "´Ó"+ip+"µÇÂ½");
				break;
			case 1:
				page = "student.jsp";
				break;
			case 2:
				page = "teacher.jsp";
				break;
			default:
				break;
			}
		}
		response.sendRedirect(page);
	}

	private User getUser(String username, String password, int userType) {
		User u = new UserDaoImpl().getUserByNamePass(username, userType);
		if (u != null) {
			if (u.getPassword().equals(password)) {
				return u;
			}
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
