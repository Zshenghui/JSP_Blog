package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcon.sqlConnection;


import user.UserInfomation;
import user.visitorlogin;
import user.visitorreg;

@WebServlet(name="visitorServlet",urlPatterns="/VisitorServlet")
public class VisitorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public VisitorServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//设置编码
		response.setContentType("text/html");
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		
		//表单提交值
		String visitorid = request.getParameter("visitorid");
		String visitorpwd = request.getParameter("visitorpwd");
		PrintWriter out = response.getWriter();
		//登录验证
		if(visitorid == null || "".equals(visitorid)){    
			out.print("用户id不能为空");
		}
		if(visitorpwd == null || "".equals(visitorpwd)){
			out.print("密码不能为空");
		}
		
		//用户名密码验证通过
		UserInfomation visitor = new UserInfomation();      
		visitor.setUserid(visitorid);      //设置userid
		visitor.setUserpwd(visitorpwd);  //设置userpass
		
		//连接数据库
		try{
		Connection conn=null;
		conn=sqlConnection.getCon();
		String sql = "select * from bk_root";
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			request.getSession().setAttribute("rootid", rs.getString("rootid"));
		}
		}catch(Exception e){
			e.printStackTrace();
			}
		try {
			boolean flag = visitorlogin.getinstance().checkVisitor(visitor);
			if(flag){ //验证通过  
		        request.getSession().setAttribute("userid", visitor.getUserid());//向会话对象写入数据
		        response.sendRedirect("IndexServlet"); //跳转
			}else{
				out.print("登录失败");
				response.sendRedirect("visitor_login.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码
		response.setContentType("text/html");
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		
		//表单提交值
		String visitorid = request.getParameter("visitorid");
		String visitorpwd = request.getParameter("visitorpwd");
		String visitorname = request.getParameter("visitorname");
		
		//将获取的表单值封装到用户信息对象中
		
		UserInfomation visitor = new UserInfomation();
		visitor.setUserid(visitorid);
		visitor.setUserpwd(visitorpwd);
		visitor.setUsername(visitorname);
		boolean flag = visitorreg.getinstance().saveVisitor(visitor);	//将游客注册信息保存到数据库
		PrintWriter out = response.getWriter();
		//注册结果
		if(flag){
			out.println("注册成功");
			response.setHeader("refresh","2;URL=visitor_login.jsp") ;
			out.println("两秒后自动跳转到游客登录界面！！！");
		}
		else{
			out.println("注册失败");
			response.setHeader("refresh","2;URL=index.jsp") ;
			out.println("两秒后自动跳转到首页！！！");
		}
		out.flush();
		out.close();
	}
		

}
