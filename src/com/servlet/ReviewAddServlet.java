package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.log.log_review;

import dbcon.sqlConnection;

@WebServlet(name="reviewaddServlet",urlPatterns="/ReviewAddServlet")
public class ReviewAddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ReviewAddServlet() {
		super();
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
		String review_details = request.getParameter("review_details");
		PrintWriter out = response.getWriter();
		//评论验证验证
		if(review_details == null || "".equals(review_details)){    
			out.print("评论不能为空");
			response.sendRedirect("review_add.jsp");
		}
		//设置对象
		log_review log_r=new log_review();
		String review_id=(String) request.getSession().getAttribute("userid");
		int logid=Integer.parseInt(request.getParameter("logid"));
		log_r.setlogid(logid);
		log_r.setreview_details(review_details);
		log_r.setreview_id(review_id);
		request.setAttribute("logid", logid);
		//连接数据库
		try{
		Connection conn=sqlConnection.getCon();
		String sql="insert into bk_lm(lmid,leavemessage,logid)"+"values(?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, log_r.getreview_id());
		ps.setString(2, log_r.getreview_details());
		ps.setInt(3, log_r.getlogid());
		ps.executeUpdate();
		request.getRequestDispatcher("/logshow.jsp").forward(request, response);
		conn.close();
		}catch(Exception e){
			request.getRequestDispatcher("/logshow.jsp").forward(request, response);
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}

}
