<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>emplist</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>
	<script language="javascript">
        function realSysTime(clock){
            var now=new Date(); //创建Date对象
            var year=now.getFullYear(); //获取年份
            var month=now.getMonth(); //获取月份
            var date=now.getDate(); //获取日期
            var day=now.getDay(); //获取星期
            var hour=now.getHours(); //获取小时
            var minu=now.getMinutes(); //获取分钟
            var sec=now.getSeconds(); //获取秒钟
            month=month+1;
            var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
            var week=arr_week[day]; //获取中文的星期
            var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
            clock.innerHTML=time; //显示系统时间
        }
        window.onload=function(){
            window.setInterval("realSysTime(time)",1000); //实时获取并显示系统时间
        }




        $(function(){
            $("input[value='delete']").live("click",function(){deleteSelect(this);});
            //7.删除选中行
            $("input[value='update']").live("click",function(){updateSelect(this);});
            $("input[value='Confirm']").live("click",function(){update();});
            $("input[value='out']").live("click",function(){out();});

        });
        function out(){
            location.href="${pageContext.request.contextPath}/head/out";
        }


        function update(){
            var id=$("#idEmp").val();
            var name=$("#empName").val();
            var age=$("#empAge").val();
            var salary=$("#empSalary").val();
            $.ajax({
                type : "POST",
                url:"${pageContext.request.contextPath}/es/UpdateEmpAction.do",
                data: "id="+id+"&name="+name+"&age="+age+"&salary="+salary,
                dataType :"JSON",
                success: function(result){
                    $("#content1").prop("style","display:none");
                    $("#"+result.id).next().html(result.name);
                    $("#"+result.id).next().next().html(result.salary);
                    $("#"+result.id).next().next().next().html(result.age);
                }
            });
        }

        function updateSelect(tag){
            var id=$(tag).parent().prev().prev().prev().prev().html();
            $.ajax({
                type : "POST",
                url:"${pageContext.request.contextPath}/es/QueryOneByIdAction.do",
                data: "id="+id,
                dataType :"JSON",
                success: function(result){
                    $("#content1").prop("style","display:no");
                    $("#idEmp").val(result.id);
                    $("#empName").val(result.name);
                    $("#empAge").val(result.age);
                    $("#empSalary").val(result.salary);

                }
            });
        }

        function deleteSelect(tag){
            var id=$(tag).parent().prev().prev().prev().prev().html();
            var ba=window.confirm("确认删除么？");
            if(ba){
                $.ajax({
                    type : "POST",
                    url:"${pageContext.request.contextPath}/es/deleteAction.do",
                    data: "id="+id,
                    dataType :"JSON",
                    success: function(result){
                        $(tag).parent().parent().remove();
                    }
                });
            }

            //location.href="${pageContext.request.contextPath}/es/deleteAction?emp.id="+id;
        }


	</script>
</head>
<body>
<div id="wrap">
	<div id="top_content">
		<div id="header">
			<div id="rightheader">
				<p id="time">
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
		<div id="content" >
			<p id="">
			</p>
			<input type="button" class="button" value="登出" />

			<img width="200px" src="${pageContext.request.contextPath}/upload/${sessionScope.user.imgname}">
			<h1>
				Welcome!
			</h1>
			<table class="table">
				<tr class="table_header">
					<td>
						ID
					</td>
					<td>
						Name
					</td>
					<td >
						Mobile
					</td>
					<td>
						telphone
					</td>
					<td>
						email
					</td>
					<td>
						city
					</td>
					<td>
						birthday
					</td>
					<td>
						gongneng
					</td>
				</tr>



				<c:forEach var="p" items="${requestScope.list}" varStatus="vs" >
					<%--   <tr <c:if test="${ vs.count%2==0 }">class="row1"</c:if><c:if test="${ vs.count%2！=0 }">class="row2"</c:if> >  --%>
					<tr
							<c:if test="${ vs.count%2!=0 }"> class="row1"</c:if>
							<c:if test="${ vs.count%2==0 }"> class="row2"</c:if>
					>
						<td  id="${p.id}">${p.id}</td>
						<td>${p.name}</td>
						<td>${p.salary}</td>
						<td>${p.age}</td>

						<td>${p.birthday}</td>
						<%--<td><fmt:formatDate value="${p.birthday}" pattern="yyyy/MM/dd"/></td>--%>

						<td>
							<input type="button" value="delete"/>&nbsp;<input type="button" value="update"/>
						</td>
					</tr>
				</c:forEach>


			</table>
			<p>
				<input type="button" class="button" value="Add Employee" onclick="location='../view/addEmp.jsp'"/>
			</p>
		</div>
	</div>


	<div id="content1"  style="display:none">
		<p id="whereami">
		</p>
		<h1>
			update Emp info:
		</h1>

		<form action="${pageContext.request.contextPath}/view/index.jsp" method="post" onsubmit="return false">
			<table cellpadding="0" cellspacing="0" border="0"
				   class="form_table">
				<tr>
					<td valign="middle" align="right">
						id:
					</td>
					<td valign="middle" align="left">
						<input id="idEmp" disabled="disabled" type="text" class="inputgri" name="emp.id" value=""/>
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right">
						name:
					</td>
					<td valign="middle" align="left">
						<input id="empName"  type="text" class="inputgri" name="emp.name" value=""/>
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right">
						salary:
					</td>
					<td valign="middle" align="left">
						<input id="empSalary" type="text" class="inputgri" name="emp.salary" value=""/>
					</td>
				</tr>
				<tr>
					<td valign="middle" align="right">
						age:
					</td>
					<td valign="middle" align="left">
						<input id="empAge" type="text" class="inputgri" name="emp.age" value=""/>
					</td>
				</tr>
			</table>
			<p>
				<input type="submit" class="button" value="Confirm" />
			</p>
		</form>
	</div>



	<div id="footer">
		<div id="footer_bg">
			ABC@126.com
		</div>
	</div>
</div>
</body>
</html>
