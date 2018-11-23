<%@ page language="java" import="java.util.*" import="com.log.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的日志</title>
    
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
  <%	request.setCharacterEncoding("GB18030");
  		response.setCharacterEncoding("GB18030"); %>
  <center>
  	
  	<% 
  		if(request.getSession().getAttribute("userid")==null)
		{
			// 用户未登陆
			response.setHeader("refresh","2;URL=index.jsp") ;
	%>
	
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="index.jsp">这里</a>！！！<br>
	<%	}
	else{
			List all = null ;
			try	{
				log_behavior log_b=new log_behavior();
				all=log_b.queryAll();
			}catch(Exception e){
				System.out.println(e) ;
				}
			%>
    	<form action="log.jsp" method="post">
    		<table style="width: 500px;" border=3>
    			<tr>
    				<td align="center">日志列表</td>
    			</tr>
    				<%
					for(int t=0;t<all.size();t++){
					logInfo log = (logInfo)all.get(t);
					// 进行循环打印，打印出所有的内容，以表格形式
					// 从数据库中取出内容
					String title = log.gettitle() ;
					int logid = log.getlogid();
					%>
					<tr>
						<td align="left" width="80%"><a href="logshow.jsp?logid=<%=logid%>"><%=title%></a></td>
					</tr>
				<% } %>
					<%
					 if(request.getSession().getAttribute("userid").equals(request.getSession().getAttribute("rootid"))){
					%>
					<tr>
						<td align="center"><a href="logadd.jsp">写日志</a></td>
					</tr>
					<%} %>
				</table>
			</form>
	</center>
	<% }%>	
  	</body>
</html>
