package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.ReplyBean;
import com.tg.iba.MySqlMapConfig;

public class ReplyDAO {
	SqlMapClient smc;
	
	public ReplyDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean addReply(ReplyBean bean){
		try {
			smc.insert("reply.addReply", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delGroup(int gno){
		try {
			int t = smc.delete("reply.delGroup",gno);
			if(t!=0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delReply(int no){
		try {
			int t = smc.delete("reply.delReply", no);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean upReply(ReplyBean bean){		
		try {
			int t = smc.update("reply.upReply",bean);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int countReply(int gno){
		int size = 0;
		try {
			size = Integer.parseInt(smc.queryForObject("reply.replyCount",gno).toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return size;
	}
	
	public List<ReplyBean> pageReply(int end, int gno){
		List<ReplyBean> list = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("end", end);
		map.put("gno", gno);
		try {
			list = smc.queryForList("reply.pageReply", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
