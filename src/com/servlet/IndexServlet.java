package com.servlet;

import java.io.IOException; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 


@WebServlet(name="indexServlet",urlPatterns="/IndexServlet")
//1.创建IndexServlet显示网站的首界面 
public class IndexServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException { 
		//2.response解决乱码问题 
		response.setContentType("text/html;charset=GB18030"); 
		//3.创建Session对象保存用户信息 
		HttpSession session=request.getSession();
		//4.方法体中的参数要与setAttribute()键一致 
	//	UserInfomation user=(UserInfomation)session.getAttribute("User"); 
		System.out.println(session.getAttribute("userid"));
		if(session.getAttribute("userid")==null){ 
			response.getWriter().print("您还未登陆，请<a href='index.jsp'>登陆</a>"); 
			}
		else
		{
			Cookie cookie=new Cookie("USERSESSIONID",(String) session.getAttribute("userid")); 
			cookie.setMaxAge(10*60); 
			cookie.setPath("/nblog");
			response.addCookie(cookie); 
			response.sendRedirect("beginshow.jsp");
		}
		} 
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); 
		} 
}
