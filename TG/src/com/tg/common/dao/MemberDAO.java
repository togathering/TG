package com.tg.common.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.MemberBean;
import com.tg.common.beans.MemberBeanIn;
import com.tg.iba.MySqlMapConfig;

public class MemberDAO {
	SqlMapClient smc;
	String nothing;
	public int totalline;
	public int endline;
	public int startline;
	public MemberDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
		nothing = "m.id";
		totalline=selectCnt();
		startline=1;
		endline= 10;
	}
	

	//아이디 추천
	
	
	public String getMemberTel(String id){
		String tel = "";
		try {
			tel =  (String) smc.queryForObject("member.telInfo", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tel;
	}
	
	public List<MemberBean> mSelectAll(){
		List<MemberBean> list = null;
		try {
			list=smc.queryForList("member.MselectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<MemberBean> selectPage(int start, int end){
		List<MemberBean> list = null;
		  try {
			 HashMap<Object, Object> map = new HashMap<Object,Object >();
			 String id = "%@%";
			 map.put("s", start);
			 map.put("e", end);
			 map.put("id",id);
			  list =(List<MemberBean>)smc.queryForList("member.MselectAll", map);
		
		  } catch (SQLException e) {
				e.printStackTrace();
			}
				return list;
	   }//selectPage
	
	public List<MemberBean> mSelectId(String id){
		List<MemberBean> list = null;
		Map<Object, Object> map = new HashMap<Object, Object>();
		id="%"+id+"%";
		System.out.println("dao"+id);
		map.put("s",1);
		map.put("e", 500);	
		map.put("id",id );
		try {
			list=smc.queryForList("member.MselectAll",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int selectCnt(){
		int cnt = 0;
			try {
				cnt =(int)smc.queryForObject("member.memberCnt");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return cnt;
	}
	
	public List<MemberBean> searchMember(String search, String id){
		List<MemberBean> list = null;
		search = "%"+search+"%";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("id", id);
		try {
			list = smc.queryForList("member.searchMember",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberBean selectMem(String id){
		MemberBean bean = null;
		try {
			bean = (MemberBean) smc.queryForObject("member.selectMem",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	public MemberBeanIn profile(String id){
		MemberBeanIn my = null;
		try {
			my = (MemberBeanIn) smc.queryForObject("member.my", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return my;
	}
	public boolean upProfile(MemberBeanIn my){
		try {
			smc.update("member.profile", my);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
