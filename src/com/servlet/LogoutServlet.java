package com.servlet;

import java.io.IOException; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

@WebServlet(name="logoutServlet",urlPatterns="/LogoutServlet")
//此类用于处理用户注销 
public class LogoutServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1.Session对象删除保存User对象 
		request.getSession().removeAttribute("userid"); 
		response.sendRedirect("/nblog/IndexServlet"); 
		} 
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); 
		} 
}
