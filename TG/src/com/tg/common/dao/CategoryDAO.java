package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryDAO {
	@Autowired
	SqlSession session;
	
	public String selectNo(String category_name){
		String category_no = session.selectOne("category.selectNo", category_name);
		
		return category_no;
	}
}
