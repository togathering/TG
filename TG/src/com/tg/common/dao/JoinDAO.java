package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.MemberBean;

public class JoinDAO {
	@Autowired
	SqlSession session;
	
	public JoinDAO() {
		
	}
	
	public boolean join(MemberBean bean){
		
		int t = session.insert("join.join", bean);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public boolean checkJoin(String id){
		
		MemberBean bean = session.selectOne("member.selectMem",id);
		if(bean != null){
			return true;
		}
		
		return false;
	}
}
