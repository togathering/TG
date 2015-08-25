package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.FriendBean;
import com.tg.iba.MySqlMapConfig;

public class FriendDAO {
	SqlMapClient smc;
	
	public FriendDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean addFriend(FriendBean fbean){
		
		try {
			smc.insert("friend.add", fbean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<FriendBean> friendRequestList(String id){
		List<FriendBean> list = null;
		try {
			list = smc.queryForList("friend.friendRequest", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean friendCheck(String id, String fid){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fid", fid);
		try {
			if(smc.queryForList("friend.friendList", map).size()==0){
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean delRequest(String id){
		try {
			int t = smc.delete("friend.delRequest", id);
			if(t == 1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delFriend(String id, String fid){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("fid", fid);
		
		try {
			int t = smc.delete("friend.delFriend", map);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
