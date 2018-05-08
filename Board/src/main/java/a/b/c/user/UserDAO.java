package a.b.c.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/board";
			String id = "root";
			String password = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String password) {
		String sql = "SELECT password FROM user WHERE id = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if (password.equals(rs.getString(1)))
					return 1;
				else
					return 0;				
			}
			
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;
	}
}
