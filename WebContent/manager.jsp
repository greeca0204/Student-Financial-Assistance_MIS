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
	if (user == null || user.getUserType() != 0) {
		response.setHeader("Refresh", "0;URL=nopermission.jsp");
	}
%>
<html>
<head>
<jsp:include page="commons/stype.jsp" />
<jsp:include page="commons/functionStype.jsp" />
<title>欢迎使用广东理工职业学院助学系统-管理员</title>
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
					<jsp:include page="/commons/managerFunction.jsp" />
				</div>
			</div>
			<div id="content" align="left" style="overflow: auto;">
				<c:choose>
					<c:when test="${result  eq 'personal_search'}"><jsp:include
							page="/showpanel/manager/personal/default.jsp" /></c:when>
					<c:when test="${result  eq 'personal_update'}"><jsp:include
							page="/showpanel/manager/personal/update.jsp" /></c:when>
					<c:when test="${result  eq 'personal_password'}"><jsp:include
							page="/showpanel/manager/personal/password.jsp" /></c:when>
					<c:when test="${result  eq 'personal_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("修改失败!重新修改!<%session.setAttribute("result", "personal_update");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'personal_password_failure'}">
						<center>
							<script type="text/javascript">
							alert("修改失败!重新修改!<%session.setAttribute("result", "personal_password");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'personal_succeed'}">
						<center>
							<script type="text/javascript">
							alert('修改成功!<%session.setAttribute("result", "personal_search");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>');
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'personal_password_failure'}">
						修改失败<a href="/showpanel/manager/personal/password.jsp"></a>
					</c:when>
					<c:when test="${result  eq 'personal'}"><jsp:include
							page="/showpanel/manager/personal/default.jsp" /></c:when>

					<c:when test="${result  eq 'search_stu'}"><jsp:include
							page="/showpanel/manager/search/stus.jsp" /></c:when>
					<c:when test="${result  eq 'search_tea'}"><jsp:include
							page="/showpanel/manager/search/teas.jsp" /></c:when>
					<c:when test="${result  eq 'search_admin'}"><jsp:include
							page="/showpanel/manager/search/admins.jsp" /></c:when>
					<c:when test="${result  eq 'search_poorstu'}"><jsp:include
							page="/showpanel/manager/search/poorstus.jsp" /></c:when>
					<c:when test="${result  eq 'search_grantship'}"><jsp:include
							page="/showpanel/manager/search/grantships.jsp" /></c:when>
					<c:when test="${result  eq 'search_college'}"><jsp:include
							page="/showpanel/manager/search/colleges.jsp" /></c:when>
					<c:when test="${result  eq 'search_grade'}"><jsp:include
							page="/showpanel/manager/search/grades.jsp" /></c:when>
					<c:when test="${result  eq 'search_class'}"><jsp:include
							page="/showpanel/manager/search/classs.jsp" /></c:when>
					<c:when test="${result  eq 'search_major'}"><jsp:include
							page="/showpanel/manager/search/majors.jsp" /></c:when>
					<c:when test="${result  eq 'search_info'}"><jsp:include
							page="/showpanel/manager/search/infos.jsp" /></c:when>
					<c:when test="${result  eq 'search_job'}"><jsp:include
							page="/showpanel/manager/search/jobs.jsp" /></c:when>
					<c:when test="${result  eq 'search_log'}"><jsp:include
							page="/showpanel/manager/search/logs.jsp" /></c:when>

					<c:when test="${result  eq 'search_stu_show'}"><jsp:include
							page="/showpanel/manager/search/stushow.jsp" /></c:when>
					<c:when test="${result  eq 'search_tea_show'}"><jsp:include
							page="/showpanel/manager/search/teashow.jsp" /></c:when>
					<c:when test="${result  eq 'search_poorstu_show'}"><jsp:include
							page="/showpanel/manager/search/poorstushow.jsp" /></c:when>
					<c:when test="${result  eq 'search_grantship_show'}"><jsp:include
							page="/showpanel/manager/search/grantshipshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_major_show'}"><jsp:include
							page="/showpanel/manager/search/majorshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_college_show'}"><jsp:include
							page="/showpanel/manager/search/collegeshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_grade_show'}"><jsp:include
							page="/showpanel/manager/search/gradeshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_class_show'}"><jsp:include
							page="/showpanel/manager/search/classshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_log_show'}"><jsp:include
							page="/showpanel/manager/search/logshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_info_show'}"><jsp:include
							page="/showpanel/manager/search/infoshow.jsp" /></c:when>
					<c:when test="${result  eq 'search_job_show'}"><jsp:include
							page="/showpanel/manager/search/jobshow.jsp" /></c:when>

					<c:when test="${result  eq 'add_stu'}"><jsp:include
							page="/showpanel/manager/add/stuadd.jsp" /></c:when>
					<c:when test="${result  eq 'add_stu_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，添加失败<%session.setAttribute("result", "add_stu");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_stu_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功,继续添加!<%session.setAttribute("result", "add_stu");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_major'}"><jsp:include
							page="/showpanel/manager/add/major.jsp" /></c:when>
					<c:when test="${result  eq 'add_major_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败，重新添加!<%session.setAttribute("result", "add_major");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_major_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!<%session.setAttribute("result", "add_major");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_poorstu'}"><jsp:include
							page="/showpanel/manager/add/stus.jsp" /></c:when>
					<c:when test="${result  eq 'add_grantship'}"><jsp:include
							page="/showpanel/manager/add/grantship.jsp" /></c:when>
					<c:when test="${result  eq 'add_grantship_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，添加失败<%session.setAttribute("result", "add_grantship");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_grantship_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功,继续添加!<%session.setAttribute("result", "add_grantship");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_tea'}"><jsp:include
							page="/showpanel/manager/add/tea.jsp" /></c:when>
					<c:when test="${result  eq 'add_tea_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败！系统错误，或者已添加该职工号的教职工，请核实后添加!<%session.setAttribute("result", "add_tea");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_tea_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功,继续添加!<%session.setAttribute("result", "add_tea");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_admin'}"><jsp:include
							page="/showpanel/manager/add/admin.jsp" /></c:when>
					<c:when test="${result  eq 'add_admin_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败！系统错误，或者已添加该账号的管理员，请核实后添加!<%session.setAttribute("result", "add_admin");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_admin_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功,继续添加!<%session.setAttribute("result", "add_admin");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_college'}"><jsp:include
							page="/showpanel/manager/add/college.jsp" /></c:when>
					<c:when test="${result  eq 'add_college_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败，重新添加!<%session.setAttribute("result", "add_college");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_college_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!<%session.setAttribute("result", "add_college");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_grade'}"><jsp:include
							page="/showpanel/manager/add/grade.jsp" /></c:when>
					<c:when test="${result  eq 'add_grade_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败，重新添加!<%session.setAttribute("result", "add_grade");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_grade_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!<%session.setAttribute("result", "add_grade");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_class'}"><jsp:include
							page="/showpanel/manager/add/class.jsp" /></c:when>
					<c:when test="${result  eq 'add_class_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，添加失败<%session.setAttribute("result", "add_class");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_class_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!继续添加<%session.setAttribute("result", "add_class");
					response.setHeader("Refresh", "0;URL=manager/add.action?type=class&action=search");%>");
							</script>
						</center>
					</c:when>
							
					<c:when test="${result  eq 'add_info'}"><jsp:include
							page="/showpanel/manager/add/info.jsp" /></c:when>
					<c:when test="${result  eq 'add_info_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("发送失败，重新发送!<%session.setAttribute("result", "add_info");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_info_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("发送成功!<%session.setAttribute("result", "add_info");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_job'}"><jsp:include
							page="/showpanel/manager/add/job.jsp" /></c:when>
					<c:when test="${result  eq 'add_job_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("添加失败!系统错误或者已经有该班级的信息，请确认后再添加<%session.setAttribute("result", "add_job");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_job_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!继续添加<%session.setAttribute("result", "add_job");
					response.setHeader("Refresh", "0;URL=manager/add.action?type=job&action=search");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'add_poorstu_add'}"><jsp:include
							page="/showpanel/manager/add/poorstuadd.jsp" /></c:when>
					<c:when test="${result  eq 'add_poorstu_add_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，添加失败<%session.setAttribute("result", "add_poorstu_add");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'add_poorstu_add_succeed'}">
						<center>
							<script type="text/javascript">
							alert("添加成功!<%session.setAttribute("result", "add_poorstu");
					response.setHeader("Refresh", "0;URL=manager/add.action?type=poorstu&action=search");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'update_stu'}"><jsp:include
							page="/showpanel/manager/update/stus.jsp" /></c:when>

					<c:when test="${result  eq 'update_stu_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败<%session.setAttribute("result", "update_stu_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_stu_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_stu");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=stu&action=search");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'update_major'}"><jsp:include
							page="/showpanel/manager/update/majors.jsp" /></c:when>
					<c:when test="${result  eq 'update_poorstu'}"><jsp:include
							page="/showpanel/manager/update/poorstus.jsp" /></c:when>
					<c:when test="${result  eq 'update_poorstu_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败<%session.setAttribute("result", "update_poorstu_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_poorstu_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_poorstu");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=poorstu&action=search");%>");
							</script>
						</center>
					</c:when>


					<c:when test="${result  eq 'update_grantship'}"><jsp:include
							page="/showpanel/manager/update/grantships.jsp" /></c:when>
					<c:when test="${result  eq 'update_grantship_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败<%session.setAttribute("result", "update_grantship_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_grantship_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_grantship");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=grantship&action=search");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_tea'}"><jsp:include
							page="/showpanel/manager/update/teas.jsp" /></c:when>
					<c:when test="${result  eq 'update_admin'}"><jsp:include
							page="/showpanel/manager/update/admins.jsp" /></c:when>
					<c:when test="${result  eq 'update_college'}"><jsp:include
							page="/showpanel/manager/update/colleges.jsp" /></c:when>
					<c:when test="${result  eq 'update_grade'}"><jsp:include
							page="/showpanel/manager/update/grades.jsp" /></c:when>
					<c:when test="${result  eq 'update_grade_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败<%session.setAttribute("result", "update_grade_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_grade_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_grade");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=grade&action=search");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'update_class'}"><jsp:include
							page="/showpanel/manager/update/classs.jsp" /></c:when>
					<c:when test="${result  eq 'update_job'}"><jsp:include
							page="/showpanel/manager/update/jobs.jsp" /></c:when>
					<c:when test="${result  eq 'update_job_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败<%session.setAttribute("result", "update_job_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_job_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_job");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=job&action=search");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'update_stu_show'}"><jsp:include
							page="/showpanel/manager/update/stushow.jsp" /></c:when>
					<c:when test="${result  eq 'update_major_show'}"><jsp:include
							page="/showpanel/manager/update/majorshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_major_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败！<%session.setAttribute("result", "update_major_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_major_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_major");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=major&action=search");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_poorstu_show'}"><jsp:include
							page="/showpanel/manager/update/poorstushow.jsp" /></c:when>
					<c:when test="${result  eq 'update_grantship_show'}"><jsp:include
							page="/showpanel/manager/update/grantshipshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_tea_show'}"><jsp:include
							page="/showpanel/manager/update/teashow.jsp" /></c:when>
					<c:when test="${result  eq 'update_tea_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败！<%session.setAttribute("result", "update_tea_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_tea_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_tea");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=tea&action=search");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_admin_show'}"><jsp:include
							page="/showpanel/manager/update/adminshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_admin_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败！<%session.setAttribute("result", "update_admin_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_admin_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_admin");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=admin&action=search");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_college_show'}"><jsp:include
							page="/showpanel/manager/update/collegeshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_college_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败！<%session.setAttribute("result", "update_college_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_college_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_college");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=college&action=search");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_grade_show'}"><jsp:include
							page="/showpanel/manager/update/gradeshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_class_show'}"><jsp:include
							page="/showpanel/manager/update/classshow.jsp" /></c:when>
					<c:when test="${result  eq 'update_class_update_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，修改失败！<%session.setAttribute("result", "update_class_show");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'update_class_update_succeed'}">
						<center>
							<script type="text/javascript">
							alert("修改成功!<%session.setAttribute("result", "update_class");
					response.setHeader("Refresh", "0;URL=manager/update.action?type=class&action=search");%>");
							</script>
						</center>
					</c:when>
							
					<c:when test="${result  eq 'update_job_show'}"><jsp:include
							page="/showpanel/manager/update/jobshow.jsp" /></c:when>


					<c:when test="${result  eq 'delete_stu'}"><jsp:include
							page="/showpanel/manager/delete/stus.jsp" /></c:when>
					<c:when test="${result  eq 'delete_stu_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_stu");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_stu_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_stu");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=stu");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_poorstu'}"><jsp:include
							page="/showpanel/manager/delete/poorstus.jsp" /></c:when>
					<c:when test="${result  eq 'delete_poorstu_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_poorstu");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_poorstu_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_poorstu");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=poorstu");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_grantship'}"><jsp:include
							page="/showpanel/manager/delete/grantships.jsp" /></c:when>
					<c:when test="${result  eq 'delete_grantship_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_grantship");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_grantship_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_grantship");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=grantship");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'delete_major'}"><jsp:include
							page="/showpanel/manager/delete/majors.jsp" /></c:when>
					<c:when test="${result  eq 'delete_major_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_major");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_major_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_major");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=major");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_tea'}"><jsp:include
							page="/showpanel/manager/delete/teas.jsp" /></c:when>
					<c:when test="${result  eq 'delete_tea_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_tea");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_tea_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_tea");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=tea");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_admin'}"><jsp:include
							page="/showpanel/manager/delete/admins.jsp" /></c:when>
					<c:when test="${result  eq 'delete_admin_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_admin");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_admin_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_admin");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=admin");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'delete_college'}"><jsp:include
							page="/showpanel/manager/delete/colleges.jsp" /></c:when>
					<c:when test="${result  eq 'delete_college_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_college");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_college_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_college");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=college");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'delete_grade'}"><jsp:include
							page="/showpanel/manager/delete/grades.jsp" /></c:when>
					<c:when test="${result  eq 'delete_grade_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_grade");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_grade_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_grade");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=grade");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_class'}"><jsp:include
							page="/showpanel/manager/delete/classs.jsp" /></c:when>
					<c:when test="${result  eq 'delete_class_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_class");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_class_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_class");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=class");%>");
							</script>
						</center>
					</c:when>
					
					<c:when test="${result  eq 'delete_job'}"><jsp:include
							page="/showpanel/manager/delete/jobs.jsp" /></c:when>
					<c:when test="${result  eq 'delete_job_failure'}">
						<center>
							<script type="text/javascript">
							alert("系统错误，删除失败<%session.setAttribute("result", "delete_job");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'delete_job_succeed'}">
						<center>
							<script type="text/javascript">
							alert("删除成功!<%session.setAttribute("result", "delete_job");
					response.setHeader("Refresh", "0;URL=manager/delete.action?type=job");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'audit_grantship'}"><jsp:include
							page="/showpanel/manager/audit/grantships.jsp" /></c:when>
					<c:when test="${result  eq 'audit_grantship_audit_failure'}">
						<center>
							<script type="text/javascript">
							alert("由于系统错误，审核失败!请与管理员联系!<%session.setAttribute("result", "audit_grantship");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'audit_grantship_audit_succeed'}">
						<center>
							<script type="text/javascript">
							alert("审核成功！<%session.setAttribute("result", "audit_grantship");response.setHeader("Refresh", "0;manager/audit.action?type=grantship");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'audit_job'}"><jsp:include
							page="/showpanel/manager/audit/jobs.jsp" /></c:when>
					<c:when test="${result  eq 'audit_job_audit_failure'}">
						<center>
							<script type="text/javascript">
							alert("由于系统错误，审核失败!请与管理员联系!<%session.setAttribute("result", "audit_job");
					response.setHeader("Refresh", "0;URL=manager.jsp");%>");
							</script>
						</center>
					</c:when>
					<c:when test="${result  eq 'audit_job_audit_succeed'}">
						<center>
							<script type="text/javascript">
							alert("审核成功！<%session.setAttribute("result", "audit_job");
					response.setHeader("Refresh", "0;manager/audit.action?type=job");%>");
							</script>
						</center>
					</c:when>

					<c:when test="${result  eq 'audit_grantship_show'}"><jsp:include
							page="/showpanel/manager/audit/grantshipshow.jsp" /></c:when>
					<c:when test="${result  eq 'audit_job_show'}"><jsp:include
							page="/showpanel/manager/audit/jobshow.jsp" /></c:when>
					<c:otherwise>
						<jsp:include page="/showpanel/manager/personal/default.jsp" />
					</c:otherwise>
				</c:choose>
			</div>

			<div id="footer">
				<jsp:include page="/commons/buttom.jsp" />
			</div>

		</div>
	</center>
</body>
</html>
