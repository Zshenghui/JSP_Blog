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
    
    <title>���˲���</title>
    
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
  <center>
	<%	if(request.getSession().getAttribute("userid")!=null)
		{
			// �û��ѵ�½
			// �û�����
			if(request.getSession().getAttribute("userid").equals(request.getSession().getAttribute("rootid")))
			{
	%>
			<h2>��½�ɹ�</h2>
			<h2>��ӭ<font color="red" size="12">
				<%=request.getSession().getAttribute("userid")%>
			</font>�ص�����</h2>
			<h4><a href="log.jsp">��������ҵ���־</a></h4>
	<%
			}
			else
			{
			%>
			<h2>��½�ɹ�</h2>
			<h2>��ӭ<font color="red" size="12">
				<%=request.getSession().getAttribute("userid")%>
			</font>����<%=request.getSession().getAttribute("rootid")%>�Ĳ���</h2>
			<h4><a href="log.jsp">�������������־</a></h4>
		<%	}
		}
		else
		{
			// �û�δ��½����ʾ�û���½������ת
			response.setHeader("refresh","2;URL=index.jsp") ;
	%>
			����δ��½�����ȵ�½������<br>
			������Զ���ת����½���ڣ�����<br>
			���û����ת���밴<a href="index.jsp">����</a>������<br>
	<%
		}
	%>
	</center>
  </body>
</html>
