package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.GroupPreferenceBean;

public class GroupPreferenceDAO {
	@Autowired
	SqlSession session;
	
	public List<GroupPreferenceBean> selectAll(){
		
		List<GroupPreferenceBean> list = session.selectList("group_pre.selectAll");
		
		return list;
	}
	
	public Integer selectRatio(int gno){
		int ratio = session.selectOne("group_pre.selectRatio",gno);
		return ratio;
	}
	
	public boolean upRatio(int ratio, int gno){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ratio", ratio);
		map.put("gno", gno);
		
		int t = session.update("group_pre.upRatio", map);
		if(t==1){
			return true;
		}
		return false;
	}
}
