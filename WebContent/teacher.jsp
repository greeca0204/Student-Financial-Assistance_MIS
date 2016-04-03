<%@page import="com.slg.zxgl.entity.Teacher"%>
<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Teacher user = (Teacher) session.getAttribute("user");
	if (user == null || user.getUserType() != 2) {
		response.setHeader("Refresh", "0;URL=nopermission.jsp");
	}
%>
<html>
<head>
<jsp:include page="commons/stype.jsp" />
<jsp:include page="commons/functionStype.jsp" />
<title>欢迎使用广东理工职业学院助学系统-教职工</title>
</head>
<body>
	<center>
		<div id="container">

			<div id="top" align="left">
				<jsp:include page="/commons/top.jsp" />
			</div>

			<div id="left">
				<div id="login">
					<jsp:include page="/commons/loginPanel.jsp" />
				</div>

				<div id="function" style="overflow: auto;">
					<jsp:include page="/commons/teacherFunction.jsp" />
				</div>
			</div>
			<div id="content" align="left" style="overflow: auto;">
				<c:choose>
					<c:when test="${result  eq 'search_stu'}"><jsp:include
							page="showpanel/teacher/stus.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_stu'}"><jsp:include
							page="showpanel/teacher/stushow.jsp"></jsp:include></c:when>


					<c:when test="${result  eq 'search_info'}"><jsp:include
							page="showpanel/teacher/infos.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_info'}"><jsp:include
							page="showpanel/teacher/infoshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'search_college'}"><jsp:include
							page="showpanel/teacher/colleges.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_college'}"><jsp:include
							page="showpanel/teacher/collegeshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'search_class'}"><jsp:include
							page="showpanel/teacher/classs.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_class'}"><jsp:include
							page="showpanel/teacher/classshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'search_grade'}"><jsp:include
							page="showpanel/teacher/grades.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_grade'}"><jsp:include
							page="showpanel/teacher/gradeshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'search_major'}"><jsp:include
							page="showpanel/teacher/majors.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'show_major'}"><jsp:include
							page="showpanel/teacher/majorshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'audit_scholarship'}"><jsp:include
							page="showpanel/teacher/scholarship.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'audit_scholarship_audit'}"><jsp:include
							page="showpanel/teacher/scholarship.jsp"></jsp:include></c:when>
					<c:when test="${result  eq 'audit_scholarship_audit_failure'}">
						<center>
							<script type="text/javascript">
							alert("由于系统错误，审核失败!请与管理员联系!<%session.setAttribute("result", "audit_scholarship");
					response.setHeader("Refresh", "0;URL=teacher.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'audit_scholarship_audit_succeed'}">
						<center>
							<script type="text/javascript">
							alert("审核成功！<%session.setAttribute("result", "audit_scholarship");
					response.setHeader("Refresh", "0;teacher/audit.action?type=scholarship");%>");
							</script>
						</center></c:when>
					<c:when test="${result  eq 'audit_scholarship_show'}"><jsp:include
							page="showpanel/teacher/scholarshipshow.jsp"></jsp:include></c:when>

					<c:when test="${result  eq 'personal'}"><jsp:include
							page="/showpanel/teacher/personal/default.jsp" /></c:when>
					<c:when test="${result  eq 'personal_search'}"><jsp:include
							page="/showpanel/teacher/personal/default.jsp" /></c:when>
					<c:when test="${result  eq 'personal_password'}"><jsp:include
							page="/showpanel/teacher/personal/password.jsp" /></c:when>
					<c:when test="${result  eq 'personal_password_failure'}">
						<center>
							<script type="text/javascript">
							alert("修改失败!重新修改!<%session.setAttribute("result", "personal_password");
					response.setHeader("Refresh", "0;URL=teacher.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'personal_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "personal_search");response.setHeader("Refresh", "0;URL=teacher.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:otherwise><jsp:include
							page="showpanel/teacher/infos.jsp"></jsp:include></c:otherwise>
				</c:choose>
			</div>
			<div id="footer">
				<jsp:include page="/commons/buttom.jsp" />
			</div>

		</div>
	</center>
</body>
</html>
