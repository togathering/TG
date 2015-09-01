package com.tg.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ValidityDAO {
	
	@Autowired
	private SqlSession session;
	
	// 금지단어 조회
	public List<String> selectBans(){
		List<String> banList = session.selectList("validity.selectList");
		return banList;
	}
}
