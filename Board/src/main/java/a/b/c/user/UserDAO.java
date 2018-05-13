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
			String url = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf-8";
			String id = "root";
			String password = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String password) {
		String sql = "SELECT password FROM Users WHERE id = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if (password.equals(rs.getString(1)))
					return 1; // 일치
				else
					return 0; // 불일치
			}
			
			return -1; // 해당 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}		
	}
	
	public int join(User user) {
		String sql = "INSERT INTO Users VALUES (?, ?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getName());
			ps.setString(4, user.getGender());
			
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
}
