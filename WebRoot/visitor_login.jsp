<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游客登录</title>
    
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
    <center><h1>游客登录</h1></center>
    <form action="VisitorServlet" method="get">
    	<table align="center" width="500">
    		<tr>
    			<td align="right" width="30%">用户名：</td>
    			<td><input type="text" class="box" name="visitorid"></td>
    		</tr>
     		<tr>
    			<td align="right" width="30%">密码：</td>
    			<td><input type="password" class="box" name="visitorpwd"></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" value="登录">
    				<input type="reset" value="重置">
  				</td>
  			</tr>
  		</table>
  	</form>
  </body>
</html>
