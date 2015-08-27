package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.ParticipantBean;

public class ParticipantDAO {
	
	@Autowired
	SqlSession session;
	
	public ParticipantDAO() {
		
	}
	
	public List<ParticipantBean> joinList(int gno){
		List<ParticipantBean> list = session.selectList("parti.joinlist", gno);
		
		return list;
	}
	
	public List<ParticipantBean> reviewList(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		List<ParticipantBean> list = session.selectList("parti.reviewlist", map);
		return list;
	}
	
	public ParticipantBean dupCheck(int gno, String id){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		
		ParticipantBean bean = session.selectOne("parti.duplicationCheck", map);
		
		return bean;
	}
	
	public boolean joinGroup(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		int t = session.insert("parti.join",map);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public boolean delGroup(int gno){
		int t = session.delete("parti.delete",gno);
		if(t != 0){
			return true;
		}
		
		return false;
	}
	
	public boolean cancelJoin(ParticipantBean pbean){
		int t = session.delete("parti.cancel",pbean);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public boolean kick(ParticipantBean pbean){
		
		int t = session.delete("parti.kick", pbean);
		if(t==1){
			return true;				
		}
		return false;
	}
}
