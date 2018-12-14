<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<script type="text/javascript" src="/emsSSM/jquery-1.8.3.js"></script>
		<script type="text/javascript">
		
		
		$(function(){  	
			$("#userName").blur(function(){
			
				 var userName=$("#userName").val();	
      					$.ajax({
	      				type : "POST",
	      				url:"${pageContext.request.contextPath}/us/CheckFormAction.do",
	      				data: "userName="+userName,
	      				dataType :"JSON",
	      				success:function(result){
	      					$("#td").remove();
	      					var td=$("<td id='td'></td>").text(result);
	      					$("#tr").append(td);
	      				}
      				}); 
      				
      				 
			}); 		
		});
			 
		function login(){
			var userName=$("#userName").val();	
			var password=$("#password").val();	
			
			if(userName=="")
				return false;
			$.ajax({
	      				type : "POST",
	      				url:"${pageContext.request.contextPath}/us/LoginAction.do",
	      				
	      				data: "userName="+userName+"&password="+password,
	      				dataType :"JSON",
	      				success:function(result){
	      					
	      					if("用户名未注册"==result||"用户名以注册"==result){
	      						$("#td").remove();
	      						var td=$("<td id='td'></td>").text(result);
	      						$("#tr").append(td);
	      					}
	      					if(result=="密码错误"){
	      						$("#td1").remove();
	      						var td=$("<td id='td1'></td>").text(result);
	      						$("#tr1").append(td);
	      					}
	      					if("ok"==result){
	      						location.href="${pageContext.request.contextPath}/es/ShowAllAction.do";		
	      					}
	      						return true;
	      				}
      		}); 
			
			return false;
		}
		</script>
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
						login
					</h1>
					<form action="${pageContext.request.contextPath}/es/ShowAllAction.do" method="post" onsubmit="return login()">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr id="tr">
								<td valign="middle" align="right">
									username:
								</td>
								<td valign="middle" align="left">
									<input id="userName" type="text" class="inputgri" name="userName" />
								</td>
							</tr>
							<tr id="tr1">
								<td valign="middle" align="right">
									password:
								</td>
								<td valign="middle" align="left">
									<input id="password" type="password" class="inputgri" name="password" />
								</td>
							</tr>
						</table>
						<p>
							<input type="submit" class="button" value="Submit &raquo;" />
							<input type="button" class="button" onclick="location.href='${pageContext.request.contextPath}/view/regist.jsp'" value="Regist &raquo;" />
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
