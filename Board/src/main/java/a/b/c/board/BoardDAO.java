package a.b.c.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public int write(String title, String contents, String id) {
		String sql = "INSERT INTO board (title, contents, id) VALUES (?, ?, ?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, contents);
			ps.setString(3, id);			
			
			return ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}
	
	public List<Board> getPostList(int pageNumber) {
		String sql = "SELECT * FROM board WHERE validation = 1 ORDER BY post_seq DESC LIMIT ?, ?";
		List<Board> postList = new ArrayList<Board>();		
		
		int postSize = 3;
		int begin = (pageNumber-1) * postSize;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, postSize);
			
			rs = ps.executeQuery();			
			while (rs.next()) {
				Board board = new Board();
				
				board.setPost_seq(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setCotents(rs.getString(3));
				board.setId(rs.getString(4));
				board.setValidation(rs.getInt(5));
				board.setReg_date(rs.getString(6));
				
				postList.add(board);
			}
			
			return postList;			
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}		
	}
	
	public Map page(int pageNumber) {
		String sql = "SELECT COUNT(*) FROM board WHERE validation = 1";		
		
		try {
			ps = conn.prepareStatement(sql);			
			
			rs = ps.executeQuery();
			rs.next();
			int totalPosts = rs.getInt(1);
			int postSize = 3;			
			int totalPages = (totalPosts-1)/postSize+1;
			
			int pageSize = 5;
			int beginPage = (pageNumber-1)/pageSize*pageSize + 1;
			int endPage = beginPage+pageSize - 1;
			
			if (endPage > totalPages)
				endPage = totalPages;			
			
			Map paging = new HashMap<String, Integer>();
			paging.put("beginPage", beginPage);
			paging.put("endPage", endPage);
			paging.put("totalPages", totalPages);
			
			return paging;
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}	
	}
	
	public Board getPost(int postNumber) {
		Board board = new Board();		
		String sql = "SELECT * FROM board WHERE validation = 1 AND post_seq = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, postNumber);
			
			rs = ps.executeQuery();
			if (rs.next()) {
				board.setPost_seq(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setCotents(rs.getString(3));
				board.setId(rs.getString(4));
				board.setValidation(rs.getInt(5));
				board.setReg_date(rs.getString(6));
			}
			
			return board;		
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}		
	}
	
	public int edit(String title, String contents, int postNumber) {
		String sql = "UPDATE board SET title = ?, contents = ? WHERE post_seq = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, contents);
			ps.setInt(3, postNumber);			
			
			return ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}
	
	public int delete(int postNumber) {
		String sql = "UPDATE board SET validation = 0 WHERE post_seq = ?";
		
		try {
			ps = conn.prepareStatement(sql);			
			ps.setInt(1, postNumber);
			
			return ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}
}
