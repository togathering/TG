package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ProvinceDAO {
	@Autowired
	SqlSession session;
	
	public String selectNo(String province_name){
		String category_no = session.selectOne("province.selectNo", province_name);
		
		return category_no;
	}
}
