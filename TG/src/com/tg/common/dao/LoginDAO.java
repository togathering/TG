package com.tg.common.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.MemberBeanIn;
import com.tg.iba.MySqlMapConfig;

public class LoginDAO {
	SqlMapClient smc;
	public LoginDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean checkLogin(String id, String pass){
		try {
			if(pass.equals((String) smc.queryForObject("log.login", id))){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}
	

	
	public String loginNick(String id){
		String nick = "";
		try {
			nick = (String) smc.queryForObject("log.logInfo", id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nick;
	}
	
}
