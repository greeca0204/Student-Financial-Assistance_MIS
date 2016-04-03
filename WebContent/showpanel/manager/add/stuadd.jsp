<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function check(form) {
		if (form.accname.value == '') {
			alert("请输入学生学号!");
			form.accname.focus();
			return false;
		}
		if (form.name.value == '') {
			alert("请输入学生姓名!");
			form.name.focus();
			return false;
		}
		if (form.politicsstatus.value == '') {
			alert("请输入学生政治面貌!");
			form.politicsstatus.focus();
			return false;
		}
		if (form.nationality.value == '') {
			alert("请输入学生民族!");
			form.nationality.focus();
			return false;
		}
		if (form.phone.value == '') {
			alert("请输入学生联系方式!");
			form.phone.focus();
			return false;
		}
		if (form.identification.value == '') {
			alert("请输入学生身份证号码!");
			form.identification.focus();
			return false;
		}
		if (form.address.value == '') {
			alert("请输入学生家庭住址!");
			form.address.focus();
			return false;
		}
		return IdentityCodeValid(form.identification.value);
	}
	function IdentityCodeValid(code) {
		var city = {
			11 : "北京",
			12 : "天津",
			13 : "河北",
			14 : "山西",
			15 : "内蒙古",
			21 : "辽宁",
			22 : "吉林",
			23 : "黑龙江 ",
			31 : "上海",
			32 : "江苏",
			33 : "浙江",
			34 : "安徽",
			35 : "福建",
			36 : "江西",
			37 : "山东",
			41 : "河南",
			42 : "湖北 ",
			43 : "湖南",
			44 : "广东",
			45 : "广西",
			46 : "海南",
			50 : "重庆",
			51 : "四川",
			52 : "贵州",
			53 : "云南",
			54 : "西藏 ",
			61 : "陕西",
			62 : "甘肃",
			63 : "青海",
			64 : "宁夏",
			65 : "新疆",
			71 : "台湾",
			81 : "香港",
			82 : "澳门",
			91 : "国外 "
		};
		var tip = "";
		var pass = true;

		if (!code
				|| !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i
						.test(code)) {
			tip = "身份证号格式错误";
			pass = false;
		}

		else if (!city[code.substr(0, 2)]) {
			tip = "地址编码错误";
			pass = false;
		} else {
			//18位身份证需要验证最后一位校验位
			if (code.length == 18) {
				code = code.split('');
				//∑(ai×Wi)(mod 11)
				//加权因子
				var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
						4, 2 ];
				//校验位
				var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
				var sum = 0;
				var ai = 0;
				var wi = 0;
				for (var i = 0; i < 17; i++) {
					ai = code[i];
					wi = factor[i];
					sum += ai * wi;
				}
				var last = parity[sum % 11];
				if (parity[sum % 11] != code[17]) {
					tip = "校验位错误";
					pass = false;
				}
			}
		}
		if (!pass)
			alert(tip);
		return pass;
	}
</script>
<div align="center" style="margin-top: 10px">
	<form name="form" method="post" action="manager/add.action" onsubmit="return check(this)">
		<table width="95%">
			<tr height="30px">
				<td></td>
				<th colspan="4">学生详细信息</th>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="4" style="background-color: #aaaaaa" align="left">基本信息</th>
			</tr>
			<tr height="30px">
				<td></td>
				<td>学号</td>
				<td width="30%"><input name="accname" maxlength="21" size="21"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></td>
				<td>姓名</td>
				<td width="30%"><input name="name" type="text" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>性别</td>
				<td><select name="gender">
						<option value="M">男</option>
						<option value="F">女</option>
				</select></td>
				<td>政治面貌</td>
				<td><input name="politicsstatus" type="text" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>民族</td>
				<td><input name="nationality" type="text"/></td>
				<td>联系方式</td>
				<td><input name="phone" type="text"
					onkeyup="value=value.replace(/[^\d]/g,'') "/></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>身份证号码</td>
				<td colspan="3"><input name="identification" type="text"
					onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18"
					size="60%"></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>地址</td>
				<td colspan="3"><input name="address" type="text" size="60%" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="4" style="background-color: #aaaaaa" align="left">班级信息</th>
			</tr>

			<tr height="30px">
				<td></td>
				<td>选择班级</td>
				<td colspan="3"><select name="classid">
						<%
							Map<Integer, String> cs = (Map) session.getAttribute("cs");
							if (cs != null) {
						%>
						<%
							for (int c : cs.keySet()) {
						%><option value="<%=c%>"><%=cs.get(c)%></option>
						<%
							}
							} else {
						%><option value="0">没有班级可选</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="2"><input name="type" value="stu" type="hidden" /><input
					name="action" value="add" type="hidden" /><input type="submit"
					value="提交" /></th>
				<th colspan="2"><input type="reset" value="重置" /></th>
			</tr>
		</table>
	</form>
</div>