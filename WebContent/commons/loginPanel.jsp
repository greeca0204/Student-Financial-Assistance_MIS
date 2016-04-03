<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String result = (String) session.getAttribute("result");
	User user = (User) session.getAttribute("user");
	if (user != null) {
%>
<br />
<p>
	欢迎你：<%=user.getName()%></p>
<p>
	<input type="button" value="安全退出"
		onclick="window.location.href='logout.action'" />
</p>
<%
	} else {
		System.out.println(result);
		if ("login".equals(result)) {
%>
<c:out value="帐户名或密码错误!"></c:out>
<%
	} else if ("logout".equals(result)) {
			session.removeAttribute("result");
			%>
<c:out value="用户已退出，重新登录!"></c:out>
<%
	} else {
%><p />
<%
	}
%>

<form action="login.action" name="loginform" method="post">
	<table>
		<tr>
			<td>类型</td>
			<td><select name="userType" id="userType">
					<option value="0">管理员</option>
					<option value="1">学生</option>
					<option value="2">教师</option>
			</select></td>
		</tr>
		<tr>
			<td>账号</td>
			<td><input type="text" maxlength="20" name="username" size="10" /></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input type="password" maxlength="20" name="password"
				size="10" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="登陆" />&nbsp;
				&nbsp; <input type="reset" value="重置" /></td>
		</tr>
	</table>
</form>
<%
	}
%>