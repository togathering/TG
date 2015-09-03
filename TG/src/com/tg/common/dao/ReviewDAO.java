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
		
		List<ReviewBean> list = session.selectList("review.list2", map);
		return list;
	}
	
	public boolean upEvaluate(ReviewBean bean){
		System.out.println("실행1");
		int t = session.update("review.comment", bean);
		if(t==1){
			System.out.println("실행2");
			return true;
		}
		System.out.println("실행3");
		return false;
	}
	
	public List<ReviewBean> rList(String id){
		List<ReviewBean> list = session.selectList("review.review", id);
		System.out.println("size:"+list.size());
		if(list.size() != 0){
			for(int i=0; i<list.size(); i++){
				System.out.println(list.get(i).getEvaluate());
			}
		}
		return list;
	}
	
	public int reviewGrade(String id){
		int grade = session.selectOne("review.grade", id);
		
		return grade;
	}
}
