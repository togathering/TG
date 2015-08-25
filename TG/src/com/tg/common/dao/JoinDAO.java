package com.tg.common.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.MemberBean;
import com.tg.iba.MySqlMapConfig;

public class JoinDAO {
	SqlMapClient smc;
	
	public JoinDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean join(MemberBean bean){
		try {
			smc.insert("join.join", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkJoin(String id){
		
		try {
			MemberBean bean = (MemberBean) smc.queryForObject("member.selectMem",id);
			if(bean != null){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
