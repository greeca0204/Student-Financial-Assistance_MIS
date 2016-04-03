<%@page import="com.slg.zxgl.entity.GradeInfo"%>
<%@page import="com.slg.zxgl.entity.MajorInfo"%>
<%@page import="com.slg.zxgl.entity.CollegeInfo"%>
<%@page import="com.slg.zxgl.entity.ClassInfo"%>
<%@page import="com.slg.zxgl.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table align="center" width="90%">
		<c:choose>
			<c:when test="${result eq 'show_info' }">
				<tr>
					<td height="30px"><a href="student/search.action?type=info">返回</a></td>
					<td height="30px">详细内容</td>
				</tr>
				<%
					Message msg = (Message) session.getAttribute("show");
							System.out.println(msg);
							if (msg != null) {
				%>
				<tr>
					<td>标题</td>
					<td><%=msg.getTitle()%></td>
				</tr>
				<tr>
					<td>详细内容</td>
					<td><%=msg.getDetails()%></td>
				</tr>
				<tr>
					<td>时间</td>
					<td><%=msg.getAddtime()%></td>
				</tr>
				<%
					}
				%>
			</c:when>
			<c:when test="${result eq 'show_class' }">
				<tr>
					<td height="30px"><a href="student/search.action?type=class">返回</a></td>
					<td height="30px">详细内容</td>
				</tr>
				<%
					ClassInfo classinfo = (ClassInfo) session.getAttribute("show");
							System.out.println(classinfo);
							if (classinfo != null) {
				%>
				<tr>
					<td>班级名称</td>
					<td><%=classinfo.getName()%></td>
				</tr>
				<tr>
					<td>班级简称</td>
					<td><%=classinfo.getShortname()%></td>
				</tr>
				<tr>
					<td>班级简介</td>
					<td><%=classinfo.getDescription()%></td>
				</tr>
				<tr>
					<td>所在学院</td>
					<td><a
						href="student/search.action?type=college&id=<%=classinfo.getCollegeid()%>"><%=classinfo.getCollegename()%></a></td>
				</tr>
				<tr>
					<td>所属年级</td>
					<td><a
						href="student/search.action?type=grade&id=<%=classinfo.getGradeid()%>"><%=classinfo.getGradename()%></a></td>
				</tr>
				<tr>
					<td>所属专业</td>
					<td><a
						href="student/search.action?type=major&id=<%=classinfo.getMajorid()%>"><%=classinfo.getMajorname()%></a></td>
				</tr>
				<%
					}
				%>
			</c:when>
			<c:when test="${result eq 'show_college' }">
				<tr>
					<td height="30px"><a href="student/search.action?type=college">返回</a></td>
					<td height="30px">详细内容</td>
				</tr>
				<%
					CollegeInfo collegeInfo = (CollegeInfo) session.getAttribute("show");
							System.out.println(collegeInfo);
							if (collegeInfo != null) {
				%>
				<tr>
					<td>学院名称</td>
					<td><%=collegeInfo.getName()%></td>
				</tr>
				<tr>
					<td>学院简称</td>
					<td><%=collegeInfo.getShortname()%></td>
				</tr>
				<tr>
					<td>学院简介</td>
					<td><%=collegeInfo.getDescription()%></td>
				</tr>
				<%
					}
				%>
			</c:when>
			<c:when test="${result eq 'show_major' }">

				<tr>
					<td height="30px"><a href="student/search.action?type=major">返回</a></td>
					<td height="30px">详细内容</td>
				</tr>
				<%
					MajorInfo majorInfo = (MajorInfo) session.getAttribute("show");
							System.out.println(majorInfo);
							if (majorInfo != null) {
				%>
				<tr>
					<td>专业名称</td>
					<td><%=majorInfo.getName()%></td>
				</tr>
				<tr>
					<td>专业简称</td>
					<td><%=majorInfo.getShortname()%></td>
				</tr>
				<tr>
					<td>专业简介</td>
					<td><%=majorInfo.getDescription()%></td>
				</tr>
				<%
					}
				%>
			</c:when>
			<c:when test="${result eq 'show_grade' }">
				<tr>
					<td height="30px"><a href="student/search.action?type=grade">返回</a></td>
					<td height="30px">详细内容</td>
				</tr>
				<%
					GradeInfo gradeInfo = (GradeInfo) session.getAttribute("show");
							System.out.println(gradeInfo);
							if (gradeInfo != null) {
				%>
				<tr>
					<td>年级名称</td>
					<td><%=gradeInfo.getName()%></td>
				</tr>
				<tr>
					<td>年级简介</td>
					<td><%=gradeInfo.getDescription()%></td>
				</tr>
				<%
					}
				%>
			</c:when>
		</c:choose>
	</table>
</div>