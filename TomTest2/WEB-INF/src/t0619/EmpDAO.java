package t0619;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmpDAO {
	Context ctx;
	Context tomCtx;
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	private void connect() {
	
		try {
			ctx = new InitialContext();
			tomCtx = (Context)ctx.lookup("java:comp/env");
			
			ds = (DataSource)tomCtx.lookup("jdbc/oracle");
			
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
	
	public ArrayList<EmpBean> select(){
		connect();
		ArrayList<EmpBean> list = new ArrayList<EmpBean>();
		String sql = "select empno, ename, sal, hiredate from emp";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				EmpBean eb = new EmpBean();
				
				eb.setEmpno(rs.getInt(1));
				eb.setEname(rs.getString(2));				
				eb.setSal(rs.getInt(3));
				eb.setHiredate(rs.getDate(4));
				list.add(eb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
	
	public void selectId(String id) {
		connect();
		
		String sql="select id from userinfo where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		disconnect();
	}
}
