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
	
	// 선호도 제출
	public boolean insert(UserPreferenceBean bean){
		int t = session.insert("user_pre.insert", bean);
		if(t==1){
			return true;			
		}
		return false;
	}
	
	public String selectTopProvince(String id){
		String topProvince = session.selectOne("user_pre.topProvince",id);
		
		return topProvince;
	}
	
	public String selectTopCategory(String id){
		String topCategory = session.selectOne("user_pre.topCategory",id);
		return topCategory;
	}
	
	public int selectRatioSum(String id){
		return session.selectOne("user_pre.ratioSum", id);
	}
}
