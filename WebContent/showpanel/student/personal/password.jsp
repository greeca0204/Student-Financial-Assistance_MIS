<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${user!=null }">
	<div>
		<form action="student/personal.action" method="post">
			<table
				style="vertical-align: middle; margin-left: 250px; margin-top: 180px;">
				<tr>
					<td>账&nbsp;&nbsp;&nbsp;号</td>
					<td><input type="text" value="${user.accname}"
						name="user.name" disabled="disabled" /></td>
				</tr>
				<tr>
					<td>旧&nbsp;密&nbsp;码</td>
					<td><input type="password" name="oldpassword" /></td>
				</tr>
				<tr>
					<td>新&nbsp;密&nbsp;码</td>
					<td><input type="password" name="newpassword" /></td>
				</tr>
				<tr>
					<td>重复新密码</td>
					<td><input type="password" name="againpassword" /></td>
				</tr>
				<tr hidden="true">
					<td colspan="2"><input name="action" value="password"
						type="hidden" /></td>
				</tr>
				<tr align="center">
					<td><input type="submit" value="修改"/></td>
					<td><input type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
</c:if>