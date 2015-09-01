package com.tg.common.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.InviteGroupBean;

public class InviteGroupDAO {

	@Autowired
	SqlSession session;
	
	public InviteGroupDAO() {
		
	}
	
	public boolean invite(InviteGroupBean bean){
		
		int t = session.insert("invite.invite", bean);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public List<InviteGroupBean> loadInvite(String id){
		List<InviteGroupBean> list = session.selectList("invite.load", id);
		
		return list;
	}
	
	public boolean inviteCheck(int gno, String fid, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fid", fid);
		map.put("gno", gno);
		map.put("id", id);
		String fid2 = session.selectOne("invite.duplication", map);
		if(fid.equals(fid2)){
			return true;
		}
		
		return false;
	}
	
	
	public boolean delInvite(String id, int gno, String fid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("gno", gno);
		map.put("fid", fid);
		
		int t = session.delete("invite.del", map);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public boolean joinAfterDelete(int gno, String fid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("fid", fid);
		
		int t = session.delete("invite.joinAfterDelete", map);
		if(t>0){
			return true;
		}
		return false;
	}
}
