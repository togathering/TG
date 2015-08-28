package com.tg.common.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginDAO {
	@Autowired
	SqlSession session;
	public LoginDAO() {
	}
	
	public boolean checkLogin(String id, String pass){
		if(pass.equals(session.selectOne("log.login", id))){
			return true;
		}
		return false;		
	}
	

	
	public String loginNick(String id){
		String nick = session.selectOne("log.logInfo", id);
		
		return nick;
	}
	
}
