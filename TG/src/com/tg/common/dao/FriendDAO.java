package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.FriendBean;

public class FriendDAO {
	@Autowired
	SqlSession session;
	
	public FriendDAO() {
		
	}
	
	public boolean addFriend(FriendBean fbean){
		
		int t = session.insert("friend.add", fbean);
		if(t==1){
			return true;			
		}			
		
		return false;
	}
	
	public List<FriendBean> friendRequestList(String id){
		
		List<FriendBean> list = session.selectList("friend.friendRequest", id);
		
		return list;
	}
	
	public boolean friendCheck(String id, String fid){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fid", fid);
		
		if(session.selectList("friend.friendList", map).size()==0){
			return false;
		}
		return true;
	}
	
	public boolean delRequest(String id){
		
		int t = session.delete("friend.delRequest", id);
		if(t == 1){
			return true;
		}
		
		return false;
	}
	
	public boolean delFriend(String id, String fid){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fid", fid);
		
		int t = session.delete("friend.delFriend", map);
		if(t==1){
			return true;
		}
		
		return false;
	}
}
