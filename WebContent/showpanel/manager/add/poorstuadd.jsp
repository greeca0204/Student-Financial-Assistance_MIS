<%@page import="com.slg.zxgl.entity.StudentInfo"%>
<%@page import="com.slg.zxgl.entity.PoorStudentInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">  
    $(document).ready(function() {  
    //敲击按键时触发  
    $("#homeincome").bind("keypress", function(event) {  
    var event= event || window.event;  
    var getValue = $(this).val();  
    //控制第一个不能输入小数点"."  
    if (getValue.length == 0 && event.which == 46) {  
        alert(1)  
        event.preventDefault();  
        return;  
    }  
    //控制只能输入一个小数点"."  
    if (getValue.indexOf('.') != -1 && event.which == 46) {  
        event.preventDefault();  
        alert(1)  
        return;  
    }  
    //控制只能输入的值  
    if (event.which && (event.which < 48 || event.which > 57) && event.which != 8 && event.which != 46) {  
        event.preventDefault();  
         return;  
        }  
    })  
    //失去焦点是触发  
    $("#homeincome").bind("blur", function(event) {  
    var value = $(this).val(), reg = /\.$/;  
    if (reg.test(value)) {  
    value = value.replace(reg, "");  
    $(this).val(value);  
    }  
    })  
    });  
</script>
<div align="center" style="margin-top: 10px">
	<%
		StudentInfo stu = (StudentInfo) session.getAttribute("show");
	%><form action="manager/add.action" method="get">
		<table width="95%">
			<tr height="30px">
				<td><a href="manager/add.action?action=return&type=poorstu">返回</a></td>
				<th colspan="3">学生详细信息</th>
			</tr>
			<%
				if (stu != null) {
			%>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">学生基本信息</th>
			</tr>
			<tr height="25px">
				<td width="15%">姓名</td>
				<td width="30%"><%=stu.getName()%></td>
				<td width="15%">学号</td>
				<td width="40%"><%=stu.getAccname()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">政治面目</td>
				<td width="30%"><%=stu.getPoliticsStatus()%></td>
				<td width="15%">民族</td>
				<td width="40%"><%=stu.getNationality()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">性别</td>
				<td width="30%"><%=stu.getGender() == "M" ? "男" : "女"%></td>
				<td width="15%">身份证号码</td>
				<td width="40%"><%=stu.getIdentification()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">手机号码</td>
				<td width="30%"><%=stu.getPhone()%></td>
				<td width="15%">地址</td>
				<td width="40%"><%=stu.getAddress()%></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">学生专业信息</th>
			</tr>
			<tr height="25px">
				<td width="15%">班级</td>
				<td width="85%" colspan="3"><%=stu.getClassname()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">年级</td>
				<td width="85%" colspan="3"><%=stu.getGradename()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">学院</td>
				<td width="85%" colspan="3"><%=stu.getCollegename()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">专业</td>
				<td width="85%" colspan="3"><%=stu.getMajorname()%></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">学生贫困信息</th>
			</tr>
			<tr height="25px">
				<td>家庭年收入</td>
				<td><input size="5px" name="homeincome"
					onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false" />元/年</td>
				<td>家庭人数</td>
				<td><input size="5px" name="homepeople"
					onkeyup="this.value=this.value.replace(/\D/g, '')" />人</td>
			</tr>
			<tr height="25px">
				<td colspan="2">贫困等级</td>
				<td colspan="2"><select name="poorgrade">
						<option value="1">一般困难</option>
						<option value="2">困难</option>
						<option value="3">特别困难</option>
				</select></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="hidden" name="stuid"
					value="<%=stu.getId()%>" /><input type="hidden" name="type"
					value="poorstu" /><input type="hidden" name="action"
					value="add" /><input type="submit" value="提交" /></td>
				<td colspan="2"><input type="reset" value="重置" /></td>
			</tr>
			<%
				} else {
			%><tr>
				<td>系统错误!稍后重试</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</div>