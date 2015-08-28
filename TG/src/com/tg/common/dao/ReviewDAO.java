package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.ReviewBean;

public class ReviewDAO {
	@Autowired
	SqlSession session;
	
	public List<ReviewBean> reviewList(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);		
		
		List<ReviewBean> list = session.selectList("review.list", map);
		return list;
	}
	
	public void upEvaluate(){
		
	}
	
	
	
}
