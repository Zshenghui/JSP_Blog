<%@ page language="java" import="java.util.*" import="com.log.*" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日志</title>
    
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
			String title = null;
			String log_details=null;
			int logid=-1;
			List reviews=null;
			logInfo log = null ;
			try{
				logid = Integer.parseInt(request.getParameter("logid"));
				if(request.getAttribute("logid")!=null)
					logid = Integer.parseInt((String)request.getAttribute("logid"));	
			}catch(Exception e){
				}
			try{
				log_behavior log_b=new log_behavior();
				log = log_b.getBylogid(logid);
				log_details = log.getdetails();
				title = log.gettitle();
				reviews=log_b.queryreview(logid);
			}catch(Exception e){
				e.printStackTrace();
				} %>
	<form action="logshow.jsp" method="post">
		<table  style="width: 700px; " border=3>
		<tr>
			<td align="center" colspan="2"><h3><%=title%></h3></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><textarea style="width: 550px; height: 300px" readonly><%=log_details %></textarea></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><h4>评论列表</h4></td>
		</tr>
			<%
				for(int i=0;i<reviews.size();i++){
				log_review log_r = (log_review)reviews.get(i);
				// 进行循环打印，打印出所有的内容，以表格形式
				// 从数据库中取出内容
				String review_details = log_r.getreview_details() ;
				String review_id = log_r.getreview_id();
				String review_time = log_r.getreview_time();
			%>
			<tr>
				<td align="left" width="70%"><%=review_details %></td>
				<td width="30%" align="left"><%=review_id %>于<%=review_time%>的评论</td>
			<%}%>
			</tr>
			<tr>
				<td align="center" colspan="2"><a href="review_add.jsp?logid=<%=logid %>">写评论</a></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<a href="log.jsp">回到日志目录</a>
			</tr>
		</table>
	</form>
	<%} %>
	</center>
  </body>
</html>
