package guest.model;

import guest.control.GuestBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GuestDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public GuestDAO() {
		// TODO Auto-generated constructor stub
	}
	
	private void connect(){
		try {
			Context ctx = new InitialContext();
			Context tomctx = (Context) ctx.lookup("java:comp/env");
			DataSource ds = (DataSource) tomctx.lookup("jdbc/oracle");
			
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
	
	public boolean addCon(GuestBean gb){
		connect();
		
		String sql="insert into guest values (guest_seq.nextval,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gb.getName());
			pstmt.setString(2, gb.getPass());
			pstmt.setString(3, gb.getEmail());
			pstmt.setString(4, gb.getTel());
			pstmt.setString(5, gb.getContents());
			int t = pstmt.executeUpdate();
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		
		return false;
	}
	
	public boolean delCon(int id){
		connect();
		
		String sql = "delete from guest where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			int t = pstmt.executeUpdate();
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return false;
	}
	
	public boolean upCon(GuestBean gb){
		connect();
		
		String sql = "update guest set name=?, pass=?, email=?, tel=?, contents=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gb.getName());
			pstmt.setString(2, gb.getPass());
			pstmt.setString(3, gb.getEmail());
			pstmt.setString(4, gb.getTel());
			pstmt.setString(5, gb.getContents());
			pstmt.setInt(6, gb.getId());
			
			int t = pstmt.executeUpdate();
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}		
		return false;
	}

	
	public ArrayList<GuestBean> findAll(){
		ArrayList<GuestBean> list = new ArrayList<GuestBean>();
		
		connect();
		
		String sql="select id, name, tel, gdate, contents from guest order by id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				GuestBean gb = new GuestBean();
				gb.setId(rs.getInt(1)); 
				gb.setName(rs.getString(2));
				gb.setTel(rs.getString(3));
				gb.setGdate(rs.getDate(4));
				gb.setContents(rs.getString(5));
				
				list.add(gb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return list;
	}
	
	public ArrayList<GuestBean> findPage(int start, int end){
		ArrayList<GuestBean> list = new ArrayList<GuestBean>();
		
		connect();
		
		String sql="select id,name,tel,gdate,contents from (select id, name, tel, gdate, contents, rownum rn "
				+ "from (select id,name,tel,gdate,contents from guest order by id desc)) "
				+ "where rn between ? and ? order by rownum";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				GuestBean gb = new GuestBean();
				gb.setId(rs.getInt(1)); 
				gb.setName(rs.getString(2));
				gb.setTel(rs.getString(3));
				gb.setGdate(rs.getDate(4));
				gb.setContents(rs.getString(5));
				
				list.add(gb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return list;
	}
	
	public int findCnt(){
		int cnt = 0;
		connect();
		
		String sql = "select count(*) from guest";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return cnt;
	}
	
	public GuestBean find(int id){
		GuestBean gb = new GuestBean();
		connect();
		
		String sql="select id, name, pass, email, tel, contents from guest where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				gb.setId(rs.getInt(1));
				gb.setName(rs.getString(2));
				gb.setPass(rs.getString(3));
				gb.setEmail(rs.getString(4));
				gb.setTel(rs.getString(5));
				gb.setContents(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		return gb;
	}
}
