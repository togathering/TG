package t0609;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

public class EmpDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Properties pro;
	
	public EmpDAO() {
	}
	
	public EmpDAO(String path) {
		pro = new Properties();
		try {
			pro.load(new FileInputStream(path+"./conn/conn.properties"));
			
			Class.forName(pro.getProperty("driver"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void connect() {
		try {
			conn = DriverManager.getConnection(pro.getProperty("url"),pro);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<HashMap<String, Object>> select() {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> hmap;
		
		connect();
		
		try {
			String sql = "select empno, ename, sal, hiredate, dname from emp e inner join dept d "
						+"on e.deptno = d.deptno ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("empno", rs.getInt(1));
				hmap.put("ename", rs.getString(2));
				hmap.put("sal", rs.getInt(3));
				hmap.put("hiredate", rs.getDate(4));
				hmap.put("dname", rs.getString(5));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();			
		}
		
		return list;
		
	}
}
