package com.study.commons.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="c##java";
	String pass="1234";
	private static DBManager instance;
	
	private DBManager() {
	}
	
	public static DBManager getInstance() {
		if(instance==null) {
			instance=new DBManager();
		}
		return instance;
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void free(Connection con) {
		if(con!=null) {try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	public void free(Connection con, PreparedStatement pstmt) {
		if(pstmt!=null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
		if(con!=null) {try {con.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	public void free(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if(rs!=null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		if(pstmt!=null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
		if(con!=null) {try {con.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	
}
