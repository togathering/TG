package com.tg.common.dao;

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
}
