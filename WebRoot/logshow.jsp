<%@ page language="java" import="java.util.*" import="com.log.*" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��־</title>
    
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
  <a href="LogoutServlet">�˳�</a>
  		<% request.setCharacterEncoding("GB18030");
			response.setCharacterEncoding("GB18030");%>
  <center>
		<%
		if(request.getSession().getAttribute("userid")==null){		
			// �û�δ��½����ʾ�û���½������ת
			response.setHeader("refresh","2;URL=index.jsp") ;
		%>
			����δ��½�����ȵ�½������<br>
			������Զ���ת����½���ڣ�����<br>
			���û����ת���밴<a href="index.jsp">����</a>������<br>
	<%
		}
		else
		{// ���ղ���
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
			<td align="center" colspan="2"><h4>�����б�</h4></td>
		</tr>
			<%
				for(int i=0;i<reviews.size();i++){
				log_review log_r = (log_review)reviews.get(i);
				// ����ѭ����ӡ����ӡ�����е����ݣ��Ա����ʽ
				// �����ݿ���ȡ������
				String review_details = log_r.getreview_details() ;
				String review_id = log_r.getreview_id();
				String review_time = log_r.getreview_time();
			%>
			<tr>
				<td align="left" width="70%"><%=review_details %></td>
				<td width="30%" align="left"><%=review_id %>��<%=review_time%>������</td>
			<%}%>
			</tr>
			<tr>
				<td align="center" colspan="2"><a href="review_add.jsp?logid=<%=logid %>">д����</a></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<a href="log.jsp">�ص���־Ŀ¼</a>
			</tr>
		</table>
	</form>
	<%} %>
	</center>
  </body>
</html>
