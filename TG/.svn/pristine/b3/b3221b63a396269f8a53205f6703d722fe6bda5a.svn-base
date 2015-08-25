package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.InviteGroupBean;
import com.tg.iba.MySqlMapConfig;

public class InviteGroupDAO {
	SqlMapClient smc;
	
	public InviteGroupDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean invite(InviteGroupBean bean){
		try {
			smc.insert("invite.invite", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<InviteGroupBean> loadInvite(String id){
		List<InviteGroupBean> list = null;
		try {
			list = smc.queryForList("invite.load", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean delInvite(String id, int gno, String fid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("gno", gno);
		map.put("fid", fid);
		
		try {
			int t = smc.delete("invite.del", map);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
