<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该助学项目信息？"))
    {
        location.href="manager/delete.action?jobid="+k+"&action=delete&type=job";
    }
}
</script>
<div>
	<div align="center" style="margin-top: 30px">
		<table width="90%">
			<tr>
				<td width="20%"><a
					href="manager/search.action?action=return&type=job">返回</a></td>
				<td width="80%" align="center">助学项目详细内容</td>
			</tr>
		</table>
	</div>
	<%
		Job job = (Job) session.getAttribute("show");

		if (job != null) {
	%>
	<table align="center" width="90%" style="margin-top: 30px">
		<tr height="30px">
			<td width="20%">岗位名称</td>
			<td><%=job.getName()%></td>
		</tr>
		<tr height="30px">
			<td>岗位需求技能</td>
			<td><%=job.getSkills()%></td>
		</tr>
		<tr height="30px">
			<td>提供单位</td>
			<td><%=job.getEmplyer()%></td>
		</tr>
		<tr height="30px">
			<td>所需人数</td>
			<td><%=job.getAllNumber()%>人</td>
		</tr>
		<tr height="30px">
			<td>工作地点</td>
			<td><%=job.getWorkpoint()%></td>
		</tr>
		<tr height="30px">
			<td>工作时间</td>
			<td><%=job.getWorktime()%></td>
		</tr>
		<tr height="30px">
			<td>面试说明</td>
			<td><%=job.getInterview()%></td>
		</tr>
		<tr height="30px">
			<td>添加时间</td>
			<td><%=job.getAddTime().toString().substring(0, 10)%></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a
				href="manager/update.action?action=show&type=job&id=<%=job.getId()%>"><button>修改</button></a>&nbsp;&nbsp;&nbsp;
				<input type="submit"  value="删除" onclick="firm(<%=job.getId()%>)"/></td>
		</tr>
	</table>
	<%
		} else {
			session.setAttribute("result", "search_job");
	%>
	<table align="center" width="90%" style="margin-top: 100px">
		<tr align="center" height="30px">
			<td>系统错误</td>
		</tr>
	</table>
	<%
		}
	%>
</div>