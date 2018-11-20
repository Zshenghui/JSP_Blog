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

import com.log.logInfo;

import dbcon.sqlConnection;

@WebServlet(name="logaddServlet",urlPatterns="/LogAddServlet")
public class LogAddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LogAddServlet() {
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
		String addlog_title = request.getParameter("addlog_title");
		String addlog_details = request.getParameter("addlog_details");
		PrintWriter out = response.getWriter();
		//日志验证
		if(addlog_title == null || "".equals(addlog_title)){    
			out.print("日志标题不能为空");
			response.sendRedirect("logadd.jsp");
		}
		if(addlog_details == null || "".equals(addlog_details)){    
			out.print("日志内容不能为空");
			response.sendRedirect("logadd.jsp");
		}
		int logid=0;		//表示日志编号
		//连接数据库
		try{
		//查询记录条数
		Connection conn=sqlConnection.getCon();
		String sql="select logid from bk_log";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
			logid++;
		//设置对象
		logInfo log=new logInfo();
		log.setlogid(logid+1);
		log.setdetails(addlog_details);
		log.settitle(addlog_title);
		//插入数据库
		String insert_sql="insert into bk_log(logid,rootlog,logtitle)"+"values(?,?,?)";
		PreparedStatement insert_ps = conn.prepareStatement(insert_sql);
		insert_ps.setInt(1, log.getlogid());
		insert_ps.setString(2, log.getdetails());
		insert_ps.setString(3, log.gettitle());
		insert_ps.executeUpdate();
		request.getRequestDispatcher("/log.jsp").forward(request, response);
		conn.close();
		}catch(Exception e){
			request.getRequestDispatcher("/log.jsp").forward(request, response);
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
	}


}
