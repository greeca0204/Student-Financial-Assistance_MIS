<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="float: left">
	<div id="functionpane" class="menu_list">
		<p class="menu_head">个人信息</p>
		<div class="menu_body">
			<a href="manager/personal.action?action=search">查看个人信息</a> <a
				href="manager/personal.action?action=update">修改个人信息</a> <a
				href="manager/personal.action?action=password">修改密码</a>
		</div>
		<c:if test="${user.permssion==1}">
			<p class="menu_head">学生信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=stu">查询学生信息</a> <a
					href="manager/add.action?type=stu">添加学生信息</a> <a
					href="manager/delete.action?type=stu">删除学生信息</a> <a
					href="manager/update.action?type=stu">修改学生信息</a>
			</div>
			<p class="menu_head">教职工信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=tea">查询教职工信息</a> <a
					href="manager/add.action?type=tea">添加教职工信息</a> <a
					href="manager/delete.action?type=tea">删除教职工信息</a> <a
					href="manager/update.action?type=tea">修改教职工信息</a>
			</div>
			<p class="menu_head">管理员信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=admin">查询管理员信息</a> <a
					href="manager/add.action?type=admin">添加管理员信息</a> <a
					href="manager/delete.action?type=admin">删除管理员信息</a> <a
					href="manager/update.action?type=admin">修改管理员信息</a>
			</div>
			<p class="menu_head">学院信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=college">查询学院信息</a> <a
					href="manager/add.action?type=college">添加学院信息</a> <a
					href="manager/delete.action?type=college">删除学院信息</a> <a
					href="manager/update.action?type=college">修改学院信息</a>
			</div>
			<p class="menu_head">年级信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=grade">查询年级信息</a> <a
					href="manager/add.action?type=grade">添加年级信息</a> <a
					href="manager/delete.action?type=grade">删除年级信息</a> <a
					href="manager/update.action?type=grade">修改年级信息</a>
			</div>
			<p class="menu_head">班级信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=class">查询班级信息</a> <a
					href="manager/add.action?type=class">添加班级信息</a> <a
					href="manager/delete.action?type=class">删除班级信息</a> <a
					href="manager/update.action?type=class">修改班级信息</a>
			</div>
			<p class="menu_head">专业信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=major">查询专业信息</a> <a
					href="manager/add.action?type=major">添加专业信息</a> <a
					href="manager/delete.action?type=major">删除专业信息</a> <a
					href="manager/update.action?type=major">修改专业信息</a>
			</div>
			<p class="menu_head">其他管理</p>
			<div class="menu_body">
				<a href="manager/add.action?type=info">发送通知</a> <a
					href="manager/search.action?type=log">查看日志</a><a
					href="manager/search.action?type=info">查看通知</a>
			</div>
		</c:if>
		<c:if test="${user.permssion==2}">
			<p class="menu_head">岗位信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=job">查看岗位信息</a> <a
					href="manager/add.action?type=job">增加岗位信息</a> <a
					href="manager/update.action?type=job">修改岗位信息</a> <a
					href="manager/delete.action?type=job">删除岗位信息</a>
			</div>
		</c:if>
		<c:if test="${user.permssion==3}">
			<p class="menu_head">学生信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=poorstu">查看贫困生信息</a> <a
					href="manager/add.action?type=poorstu&action=search">添加贫困生信息</a> <a
					href="manager/update.action?type=poorstu">修改贫困生信息</a> <a
					href="manager/delete.action?type=poorstu">删除贫困生信息</a>
			</div>
			<p class="menu_head">助学信息管理</p>
			<div class="menu_body">
				<a href="manager/search.action?type=grantship">查看助学项目</a> <a
					href="manager/add.action?type=grantship">添加助学项目</a> <a
					href="manager/update.action?type=grantship">修改助学项目</a> <a
					href="manager/delete.action?type=grantship">删除助学项目</a>
			</div>
			<p class="menu_head">审核管理</p>
			<div class="menu_body">
				<a href="manager/audit.action?type=grantship">审核学生助学申请</a>
			</div>
		</c:if>
		<c:if test="${user.permssion==4}">
			<p class="menu_head">学生岗位申请管理</p>
			<div class="menu_body">
				<a href="manager/audit.action?type=job">审核学生岗位申请</a>
			</div>
		</c:if>
	</div>
	<!--Code for menu ends here-->
</div>