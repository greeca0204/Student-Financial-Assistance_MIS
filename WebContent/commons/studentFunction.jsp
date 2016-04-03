<%@page import="com.slg.zxgl.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Student s = (Student) session.getAttribute("user");
%>
<div style="float: left">
	<div id="functionpane" class="menu_list">
		<p class="menu_head">个人资料</p>
		<div class="menu_body">
			<a href="student/personal.action?action=search">查看基本资料</a>
			<%
				if (s.isPoor()) {
			%>
			<a href="student/personal.action?action=poorinfo">查看贫困生资料</a>
			<%
				}
			%><a href="student/personal.action?action=password">修改密码</a>
		</div>
		<p class="menu_head">申请操作</p>
		<div class="menu_body">
			<%
			if (s.isPoor()) {
		%>
			<a href="student/request.action?type=job">申请岗位</a> <a
				href="student/request.action?type=grantship">申请助学金</a>
			<%
			}
		%><a href="student/request.action?type=scholarship">申请奖学金</a>
		</div>
		<p class="menu_head">查看信息</p>
		<div class="menu_body">
			<a href="student/search.action?type=info">查看通知</a> <a
				href="student/search.action?type=class">查看班级</a> <a
				href="student/search.action?type=college">查看学院</a> <a
				href="student/search.action?type=major">查看专业</a> <a
				href="student/search.action?type=grade">查看年级</a><a
				href="student/search.action?type=scholarship">查看奖学申请结果</a>
			<%
				if (s.isPoor()) {
			%>
			<a href="student/search.action?type=grantship">查看助学申请结果</a><a
				href="student/search.action?type=reqjob">查看岗位申请结果</a>
			<%
				}
			%>
		</div>
	</div>
	<!--Code for menu ends here-->
</div>