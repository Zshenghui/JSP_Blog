package user;
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import dbcon.sqlConnection; 
import user.UserInfomation;

public class visitorreg {
	private static visitorreg instance=null;

	//获取实例化对象
	public static visitorreg getinstance(){
		if(instance==null)
			instance = new visitorreg();
	return instance;
	}
	
	//保存游客注册信息
	public boolean saveVisitor(UserInfomation user){
		Connection conn=null;
		try{
			conn = sqlConnection.getCon();
			String sql="insert into bk_visitor(visitorid,visitorpwd,visitorname)"+"values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserpwd());
			ps.setString(3, user.getUsername());
			ps.executeUpdate();
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
	return false;
	}
}
