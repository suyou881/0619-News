package com.study.model.news;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.commons.db.DBManager;

public class NewsDAO {
	DBManager manager = DBManager.getInstance();
	
	//���� �Ѱ� ���
	public int insert(News news) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		String sql="insert into news(news_id, title, writer, content)";
		sql+=" values (seq_news.nextval, ?,?,?)";
		
		con=manager.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getWriter());
			pstmt.setString(3, news.getContent());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.free(con, pstmt);
		}
		return result;
	}
	
	public List selectAll() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<News> list = new ArrayList<News>();
		StringBuilder sb=new StringBuilder();
		sb.append("SELECT n.NEWS_ID, title, writer, regdate, hit, count(comments_id) as cnt");
		sb.append(" FROM news n LEFT OUTER JOIN COMMENTS c");
		sb.append(" ON n.NEWS_ID = c.NEWS_ID ");
		sb.append(" GROUP BY n.NEWS_ID, title, writer, regdate, hit");
		sb.append("	ORDER BY news_id desc");
		
		
		con=manager.getConnection();
		try {
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				News news = new News();
				news.setNews_id(rs.getInt("news_id"));
				news.setTitle(rs.getString("title"));
				news.setWriter(rs.getString("writer"));
				//news.setContent(rs.getString("content"));
				news.setRegdate(rs.getString("regdate"));
				news.setHit(rs.getShort("hit"));
				news.setCnt(rs.getInt("cnt"));
				
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.free(con, pstmt, rs);
		}
		return list;
	}
	
	public News selectOne(int news_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		News news=null;
		int result=0;
		
		
		con=manager.getConnection();
		try {
			con.setAutoCommit(false);
			
			String sql1="update news set hit=hit+1 where news_id=?";
			pstmt=con.prepareStatement(sql1);
			pstmt.setInt(1, news_id);
			pstmt.executeUpdate();
			
			String sql="select* from news where news_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				news = new News();
				
				news.setNews_id(rs.getInt("news_id"));
				news.setTitle(rs.getString("title"));
				news.setWriter(rs.getString("writer"));
				news.setContent(rs.getString("content"));
				news.setRegdate(rs.getString("regdate"));
				news.setHit(rs.getShort("hit"));
				
				con.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("세부 업무 중 실패한게 있으므로, 원상 복귀합니다.");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				con.setAutoCommit(true);
				manager.free(con, pstmt, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return news;
	}
	
	public int edit(News news) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		String sql="update news set title=?, writer=?, content=?";
		sql+="where news_id=?";
		
		con=manager.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getWriter());
			pstmt.setString(3, news.getContent());
			pstmt.setInt(4, news.getNews_id());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.free(con, pstmt);
		}
		return result;
	}
	
	public int delete(int news_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		String sql="delete news where news_id=?";
		
		con=manager.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			manager.free(con, pstmt);
		}
		return result;
	}
	
}
