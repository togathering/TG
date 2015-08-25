package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.ParticipantBean;
import com.tg.iba.MySqlMapConfig;

public class ParticipantDAO {
	SqlMapClient smc;
	public ParticipantDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public List<ParticipantBean> joinList(int gno){
		List<ParticipantBean> list = null;
		
		try {
			list = smc.queryForList("parti.joinlist", gno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ParticipantBean dupCheck(int gno, String id){
		ParticipantBean bean = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		try {
			bean = (ParticipantBean) smc.queryForObject("parti.duplicationCheck", map);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public boolean joinGroup(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		try {
			smc.insert("parti.join",map);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delGroup(int gno){
		try {
			int t = smc.delete("parti.delete",gno);
			if(t != 0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cancelJoin(ParticipantBean pbean){
		try {
			int t =  smc.delete("parti.cancel",pbean);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean kick(ParticipantBean pbean){
		
		try {
			int t = smc.delete("parti.kick", pbean);
			if(t==1){
				return true;				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
