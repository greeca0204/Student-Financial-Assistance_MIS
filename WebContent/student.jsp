<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	if (user == null || user.getUserType() != 1) {
		response.setHeader("Refresh", "0;URL=nopermission.jsp");
	}
%>
<html>
<head>
<jsp:include page="commons/stype.jsp" />
<jsp:include page="commons/functionStype.jsp" />
<title>欢迎使用广东理工职业学院助学系统-学生</title>
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
				<div id="function"  style="overflow:auto;">
					<jsp:include page="/commons/studentFunction.jsp" />
				</div>
			</div>
			<div id="content" align="left" style="overflow:auto;">
				<c:choose>
					<c:when test="${result  eq 'personal_search'}"><jsp:include
							page="/showpanel/student/personal/default.jsp" /></c:when>
					<c:when test="${result  eq 'personal_poorinfo'}"><jsp:include
							page="/showpanel/student/personal/poorinfo.jsp" /></c:when>
					<c:when test="${result  eq 'personal_password'}"><jsp:include
							page="/showpanel/student/personal/password.jsp" /></c:when>
					<c:when test="${result  eq 'personal'}"><jsp:include
							page="/showpanel/student/personal/default.jsp" /></c:when>
					<c:when test="${result  eq 'personal_password_failure'}">
						<center>
							<script type="text/javascript">
							alert("修改失败!重新修改!<%
									session.setAttribute("result","personal_password");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'personal_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%
									session.setAttribute("result","personal_search");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>


					<c:when test="${result  eq 'request_grantship'}"><jsp:include
							page="/showpanel/student/request/grantship.jsp" /></c:when>
					<c:when test="${result  eq 'request_grantship_search'}"><jsp:include
							page="/showpanel/student/request/grantship.jsp" /></c:when>
					<c:when test="${result  eq 'request_grantship_add'}"><jsp:include
							page="/showpanel/student/request/grantshipadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_grantship_add_req'}"><jsp:include
							page="/showpanel/student/request/grantshipadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_grantship_add_req_faliure'}">
						<center>
							<script type="text/javascript">
							alert("申请失败（系统错误，或者已申请过该项目，不能重复申请!)<%
									session.setAttribute("result","request_grantship");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'request_grantship_add_req_succeed'}">
						<center>
							<script type="text/javascript">
							alert("申请成功!<%
									session.setAttribute("result","request_grantship");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'request_scholarship_add'}"><jsp:include
							page="/showpanel/student/request/scholarshipadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_scholarship_add_req'}"><jsp:include
							page="/showpanel/student/request/scholarshipadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_scholarship_search'}"><jsp:include
							page="/showpanel/student/request/scholarship.jsp" /></c:when>
					<c:when test="${result  eq 'request_scholarship'}"><jsp:include
							page="/showpanel/student/request/scholarship.jsp" /></c:when>
					<c:when test="${result  eq 'request_scholarship_add_req_faliure'}">
						<center>
							<script type="text/javascript">
							alert("申请失败（系统错误，或者已申请过该项目，不能重复申请!)<%
									session.setAttribute("result","request_scholarship");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'request_scholarship_add_req_succeed'}">
						<center>
							<script type="text/javascript">
							alert("申请成功!<%
									session.setAttribute("result","request_scholarship");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
							
					<c:when test="${result  eq 'request_job'}"><jsp:include
							page="/showpanel/student/request/job.jsp" /></c:when>
					<c:when test="${result  eq 'request_job_search'}"><jsp:include
							page="/showpanel/student/request/job.jsp" /></c:when>
					<c:when test="${result  eq 'request_job_add'}"><jsp:include
							page="/showpanel/student/request/jobadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_job_add_req'}"><jsp:include
							page="/showpanel/student/request/jobadd.jsp" /></c:when>
					<c:when test="${result  eq 'request_job_add_req_faliure'}">
						<center>
							<script type="text/javascript">
							alert("申请失败（系统错误，或者已申请过该项目，不能重复申请!)<%
									session.setAttribute("result","request_job");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'request_job_add_req_succeed'}">
						<center>
							<script type="text/javascript">
							alert("申请成功!<%
									session.setAttribute("result","request_job");
									response.setHeader("Refresh", "0;URL=student.jsp");
									%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'request'}"><jsp:include
							page="/showpanel/student/request/scholarshipadd.jsp" /></c:when>


					<c:when test="${result  eq 'search_info'}"><jsp:include
							page="/showpanel/student/search/info.jsp" /></c:when>
					<c:when test="${result  eq 'search_class'}"><jsp:include
							page="/showpanel/student/search/class.jsp" /></c:when>
					<c:when test="${result  eq 'search_college'}"><jsp:include
							page="/showpanel/student/search/college.jsp" /></c:when>
					<c:when test="${result  eq 'search_major'}"><jsp:include
							page="/showpanel/student/search/major.jsp" /></c:when>
					<c:when test="${result  eq 'search_grade'}"><jsp:include
							page="/showpanel/student/search/grade.jsp" /></c:when>
					<c:when test="${result  eq 'search_reqjob'}"><jsp:include
							page="/showpanel/student/search/application.jsp" /></c:when>
					<c:when test="${result  eq 'search_scholarship'}"><jsp:include
							page="/showpanel/student/search/application.jsp" /></c:when>
					<c:when test="${result  eq 'search_grantship'}"><jsp:include
							page="/showpanel/student/search/application.jsp" /></c:when>
					<c:when test="${result  eq 'search'}"><jsp:include
							page="/showpanel/student/search/info.jsp" /></c:when>
							
					<c:when test="${result.substring(0,4)  eq 'show'}"><jsp:include
							page="/showpanel/student/show.jsp" /></c:when>
							
					<c:otherwise><jsp:include
							page="/showpanel/student/search/info.jsp" /></c:otherwise>
				</c:choose>
			</div>

			<div id="footer">
				<jsp:include page="/commons/buttom.jsp" />
			</div>

		</div>
	</center>
</body>
</html>
