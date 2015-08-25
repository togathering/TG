package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.ReplyBean;

public class ReplyDAO {
	@Autowired
	SqlSession session;
	public ReplyDAO() {
		
	}
	
	public boolean addReply(ReplyBean bean){
		
		int t = session.insert("reply.addReply", bean);
		if(t==1)
		{
			return true;
		}
		return false;
	}
	
	public boolean delGroup(int gno){
		int t = session.delete("reply.delGroup",gno);		
		if(t!=0){
			return true;
		}
		return false;
	}
	
	public boolean delReply(int no){
		
		int t = session.delete("reply.delReply", no);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public boolean upReply(ReplyBean bean){		
		
		int t = session.update("reply.upReply",bean);
		if(t==1){
			return true;
		}
		
		return false;
	}
	
	public int countReply(int gno){
		int size = session.selectOne("reply.replyCount",gno);
		
		return size;
	}
	
	public List<ReplyBean> pageReply(int end, int gno){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("end", end);
		map.put("gno", gno);
		List<ReplyBean> list = session.selectList("reply.pageReply", map);
		
		return list;
	}
}
