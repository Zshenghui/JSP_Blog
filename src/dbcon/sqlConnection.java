package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class sqlConnection {
	private static Connection conn = null;
	public static Connection getCon() { 
		try { 
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
			String user = "sa"; 
			String pwd = "sa"; 
			String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=db_database9"; 
			conn = DriverManager.getConnection(url, user, pwd); 
			} catch (Exception e) { 
				e.printStackTrace(); 
				} 
		return conn;
	}

}
