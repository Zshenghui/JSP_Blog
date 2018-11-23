<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>写日志</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <body>
  <a href="LogoutServlet">退出</a>
    <% request.setCharacterEncoding("GB18030");
			response.setCharacterEncoding("GB18030");%>
  <center>
		<%
		if(request.getSession().getAttribute("userid")==null){		
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=index.jsp") ;
		%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="index.jsp">这里</a>！！！<br>
	<%
		}
		else
		{// 接收参数
			int logid=0;
			try{
				logid = Integer.parseInt(request.getParameter("logid"));
			}catch(Exception e){
				}
	 %>
	 	<form action="LogAddServlet" method="post">
	 		<table border="1" style="width: 600px; ">
	 			<tr>
	 				<td align="center">
	 				<input type="text" name="addlog_title" value="请在此处添加日志标题" style="width: 400px; ">
	 				</td>	
	 			</tr>
	 			<tr>
	 				<td><textarea style="width: 500px; height: 300px" name="addlog_details"></textarea></td>
	 			</tr>
	 			<tr>
	 				<td align="center"><input type="submit" value="提交"></td>
	 			</tr>
	 			<tr>
	 				<td align="right" border="0"><a href="log.jsp">不想写了？点击回到日志列表</a></td>
	 			</tr>
	 		</table>
	 	</form>
	 <%} %>
	</center>			
  </body>
</html>
