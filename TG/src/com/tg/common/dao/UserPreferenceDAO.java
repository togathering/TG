package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.UserPreferenceBean;

public class UserPreferenceDAO {
	@Autowired
	SqlSession session;
	
	public UserPreferenceBean select(String id){
		
		UserPreferenceBean bean = session.selectOne("user_pre.select", id);
		
		return bean;
	}
}
