package t0608;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import oracle.jdbc.driver.OracleDriver;


public class DAO {
	Properties pro;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public DAO() {
	}
	
	public DAO(String path) {
		pro = new Properties();
		try {
			
			pro.load(new FileReader(path+"/conn/conn.properties"));
			Class.forName(pro.getProperty("driver"));
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void connect() {
		try {
			conn = DriverManager.getConnection(pro.getProperty("url"),pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DB연결성공!!");
	}
	
	private void disconnect() {
		try {
			if(rs != null) rs.close(); 
			if(pstmt != null) pstmt.close(); 
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	
	public boolean update(int cnt) {
		connect();
		try {
			String sql = "update count set cnt = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnt);
			int su = pstmt.executeUpdate();
			if (su == 1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return false;
	}
	
	public int select() {
		connect();
		int cnt=0;
		try {
			String sql = "select cnt from count";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		
		return cnt;
	}
}
