package com.tg.common.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.WishBean;

public class WishDAO {
	@Autowired
	SqlSession session;
	
	public WishDAO() {
	}
	
	public boolean wishGroup(WishBean bean){
		int t = session.insert("wish.wishGroup", bean);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public boolean cancelWish(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		
		int t =  session.delete("wish.cancel",map);
		if(t == 1){
			return true;
		}
		return false;
	}
	
	public WishBean checkWish(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		WishBean bean = session.selectOne("wish.wishCheck",map);
		return bean;
	}
	
	public void countWish(){
		
	}
}
