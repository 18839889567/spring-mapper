<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>regist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
														    
		<script type="text/javascript" src="/ems/jquery-1.8.3.js"></script>
		<SCRIPT type="text/javascript">
		$(function(){  	
			$("#userName").blur(function(){
				var userName=$("#userName").val();	
      			$.ajax({
	      		type : "POST",
	      		url:"${pageContext.request.contextPath}/us/CheckFormAction.do",
	      		data: "user.userName="+userName,
	      		dataType :"JSON",
	      		success:function(result){
	      			alert(result);
	      		}
      			}); 
			}); 
		});
		
		
		$(function(){  	
			$("#num").click(function(){
				$("#num").prop("src","${pageContext.request.contextPath}/us/ImageAction.do?time="+new Date());
			}); 
		});
			
			
			
		</SCRIPT>
	</head>
	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								2009/11/20
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="#">main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						注册
					</h1>
					<form action="login.html" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									用户名:
								</td>
								<td valign="middle" align="left">
									<input id="userName" type="text" class="inputgri" name="user.userName" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									真实姓名:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="user.name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									密码:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="user.password" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									性别:
								</td>
								<td valign="middle" align="left">
									男
									<input type="radio" class="inputgri" name="user.sex" value="1" checked="checked"/>
									女
									<input type="radio" class="inputgri" name="user.sex" value="0"/>
								</td>
							</tr>
							
							<tr>
								<td valign="middle" align="right">
									验证码:
									<img id="num" width="100px" src="${pageContext.request.contextPath}/us/ImageAction.do" />
									<a href="javascript:;" onclick="document.getElementById('num').src ='${pageContext.request.contextPath}/us/ImageAction.do?time='+(new Date()).getTime()">换一张</a>
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="code" />
								</td>
							</tr>
						</table>
						<p>
							<input type="submit" class="button" value="Submit &raquo;" />
						</p>
					</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>