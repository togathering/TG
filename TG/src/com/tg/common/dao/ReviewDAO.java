package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.ReviewBean;

public class ReviewDAO {
	@Autowired
	SqlSession session;
	
	public boolean insertReview(ReviewBean bean){
		int t = session.insert("review.insert", bean);
		if(t==1){
			return true;
		}
		return false;
	}
}
