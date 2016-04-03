<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="float: left">
	<div id="functionpane" class="menu_list">
		<p class="menu_head">个人资料</p>
		<div class="menu_body">
			<a href="teacher/personal.action?action=search">查看个人信息</a> <a
				href="teacher/personal.action?action=password">修改密码</a>
		</div>
		<p class="menu_head">查看操作</p>
		<div class="menu_body">
			<a href="teacher/search.action?type=stu">查询学生信息</a> <a
				href="teacher/search.action?type=info">查询通告信息</a> <a
				href="teacher/search.action?type=college">查询学院信息</a> <a
				href="teacher/search.action?type=class">查询班级信息</a> <a
				href="teacher/search.action?type=grade">查询年级信息</a> <a
				href="teacher/search.action?type=major">查询专业信息</a>
		</div>
		<p class="menu_head">审核操作</p>
		<div class="menu_body">
			<a href="teacher/audit.action?type=scholarship">审核奖学金申请</a>
		</div>
	</div>
</div>