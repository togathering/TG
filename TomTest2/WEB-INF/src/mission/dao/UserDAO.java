package mission.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mission.beans.UserInfo;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	private void connect() {
		try {
			Context ctx = new InitialContext();
			Context tomCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)tomCtx.lookup("jdbc/oracle");
			
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void disconnect(){
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public boolean insert(UserInfo info) {
		connect();
		
		String sql = "insert into userinfo values (?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getId());
			pstmt.setString(2, info.getPass());
			pstmt.setString(3, info.getName());
			pstmt.setString(4, info.getJumin());
			pstmt.setString(5, info.getBirth());
			pstmt.setString(6, info.getZip());
			pstmt.setString(7, info.getAddr());
			pstmt.setString(8, info.getEmail());
			pstmt.setString(9, info.getJob());
			int i = pstmt.executeUpdate();
			if (i==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return false;
	}
	
	public String selectLogin(String id) {
		String pass="";
		connect();
		
		String sql ="select pass from userinfo where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pass = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return pass;
	}
	
	public UserInfo select(String id) {
		UserInfo info = new UserInfo();
		connect();
		
		String sql = "select name, jumin, birth, zip, addr, email, job from userinfo where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				info.setName(rs.getString(1));
				info.setJumin(rs.getString(2));
				info.setBirth(rs.getString(3));
				info.setZip(rs.getString(4));
				info.setAddr(rs.getString(5));
				info.setEmail(rs.getString(6));
				info.setJob(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return info;
	}
	
	public boolean update(UserInfo info){
		connect();
		String sql ="update userinfo set pass=?, zip=?, addr=?, email=?, job=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getPass());
			pstmt.setString(2, info.getZip());
			pstmt.setString(3, info.getAddr());
			pstmt.setString(4, info.getEmail());
			pstmt.setString(5, info.getJob());
			pstmt.setString(6, info.getId());
			int i=pstmt.executeUpdate();
			if(i==1){
				
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return false;
	}
	
	public boolean delete(String id){
		connect();
		
		String sql = "delete from userinfo where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int i = pstmt.executeUpdate();
			if(i==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return false;
	}
	
	public String selectId(String id) {
		String str="";
		connect();
		
		String sql="select id from userinfo where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				str = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		
		return str;
	}
}
