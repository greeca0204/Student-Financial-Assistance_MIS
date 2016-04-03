<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<SCRIPT LANGUAGE="JavaScript">
	function checkFrom() {
		if (document.getElementById("name").value == "") {
			alert("警告：没有输入姓名");
			document.getElementById("name").focus();
			return false;
		}
		updateform.submit();
	}
</SCRIPT>
<c:if test="${user!=null }">
	<div>
		<form action="manager/personal.action" method="post" name="updateform"
			onsubmit="checkFrom(); return false;">
			<table
				style="vertical-align: middle; margin-left: 200px; margin-top: 180px;">
				<tr align="center">
					<td>账&nbsp;号</td>
					<td><input type="text" value="${user.accname }"
						disabled="disabled" /></td>
				</tr>
				<tr align="center">
					<td>姓&nbsp;名</td>
					<td><input type="text" value="${user.name }" name="name" /></td>
				</tr>
				<tr align="center">
					<td>用户类型</td>
					<td><c:choose>
							<c:when test="${user.permssion==1}">系统管理员</c:when>
							<c:when test="${user.permssion==2}">人事管理员</c:when>
							<c:when test="${user.permssion==3}">贫困生管理员</c:when>
						</c:choose></td>
				</tr>
				<tr hidden="true">
					<td colspan="2"><input name="action" value="update"
						type="hidden" /></td>
				</tr>
				<tr align="center">
					<td><input type="submit" value="修改" /></td>
					<td><input type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
	</div>
</c:if>