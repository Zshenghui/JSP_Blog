package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import dbcon.sqlConnection;
public class rootlogin {
	private static rootlogin instance=null;
	
	//获取实例化对象
	public static rootlogin getinstance(){
		if(instance==null)
			instance = new rootlogin();
	return instance;
	}
	
	//保存博主登录信息
	public boolean checkroot(UserInfomation user){
		Connection conn=null;
		boolean flag=false;
		try{
			conn = sqlConnection.getCon();
			String sql="select * from bk_root where rootid=? and rootpwd=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpwd());
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				if(rs.getString("rootid").equals(user.getUserid())&&rs.getString("rootpwd").equals(user.getUserpwd()))
				{
					flag=true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	return flag;
	}
}
