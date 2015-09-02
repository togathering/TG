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
	
	public boolean changeNewbie(String id){
		int t = session.update("log.changeNewbie", id);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public String loginNick(String id){
		String nick = session.selectOne("log.logInfo", id);
		
		return nick;
	}
	
	public String checkNewbie(String id){
		System.out.println("되냐1");
		String status = session.selectOne("log.checkNewbie", id);
		System.out.println("되냐2");
		System.out.println("checkNewbie() 실행결과는 "+status);
		return status;
	}
	
}
