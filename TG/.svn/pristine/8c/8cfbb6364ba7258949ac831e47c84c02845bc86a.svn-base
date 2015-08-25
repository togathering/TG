package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.WishBean;
import com.tg.iba.MySqlMapConfig;

public class WishDAO {
	SqlMapClient smc;
	
	public WishDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean wishGroup(WishBean bean){
		try {
			smc.insert("wish.wishGroup", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cancelWish(int gno, String id){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		
		try {
			int t =  smc.delete("wish.cancel",map);
			if(t == 1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public WishBean checkWish(int gno, String id){
		WishBean bean = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("id", id);
		try {
			bean = (WishBean) smc.queryForObject("wish.wishCheck",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public void countWish(){
		
	}
}
