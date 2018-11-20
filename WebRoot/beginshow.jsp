<%@ page language="java" 
import="java.util.*" 
pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人博客</title>
    
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
  <center>
	<%	if(request.getSession().getAttribute("userid")!=null)
		{
			// 用户已登陆
			// 用户分类
			if(request.getSession().getAttribute("userid").equals(request.getSession().getAttribute("rootid")))
			{
	%>
			<h2>登陆成功</h2>
			<h2>欢迎<font color="red" size="12">
				<%=request.getSession().getAttribute("userid")%>
			</font>回到博客</h2>
			<h4><a href="log.jsp">点击进入我的日志</a></h4>
	<%
			}
			else
			{
			%>
			<h2>登陆成功</h2>
			<h2>欢迎<font color="red" size="12">
				<%=request.getSession().getAttribute("userid")%>
			</font>来到<%=request.getSession().getAttribute("rootid")%>的博客</h2>
			<h4><a href="log.jsp">点击进入他的日志</a></h4>
		<%	}
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=index.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="index.jsp">这里</a>！！！<br>
	<%
		}
	%>
	</center>
  </body>
</html>
