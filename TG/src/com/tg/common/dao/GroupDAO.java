package com.tg.common.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.GroupBean;
import com.tg.iba.MySqlMapConfig;

public class GroupDAO {
	SqlMapClient smc;
	
	@Autowired
	SqlSession session;
	public GroupDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
		
		
	}
	
	public boolean create(GroupBean bean){
		
		int t = session.insert("group.insert", bean);
		if(t==1){
			return true;
		}	
		
		return false;
	}
	
	public List<GroupBean> listAll(String order, int pageCnt){
		List<GroupBean> list = null;
		try {
			list = smc.queryForList("group.list", order, 0, pageCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<GroupBean> mainList(){
		List<GroupBean> list = null;
		try {
			list = smc.queryForList("group.mainlist", 0, 6);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<GroupBean> mSelectAll(){
		List<GroupBean> list = null;
		try {
			 list = smc.queryForList("admin.showAllGroup");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<GroupBean> search(String keyword, String order, int pageCnt){
		List<GroupBean> list = null;
		try {
			keyword = "%"+keyword+"%";
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
			map.put("order", order);
			list =  smc.queryForList("group.search", map, 0, pageCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<GroupBean> mSearchTitle(String gtitle){
		List<GroupBean> list = null;
		gtitle="%"+gtitle+"%";

		try {
			list=smc.queryForList("group.MsearchTitle",gtitle);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 명준 : 상세페이지 보기
	public GroupBean selectGroupInfo(int gno){
		GroupBean bean = null;
		try {
			
			bean = (GroupBean)smc.queryForObject("group.info", gno);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return bean;
	}
	
	public GroupBean wantGsum(int gno){
		GroupBean bean = null;
		try {
			bean = (GroupBean) smc.queryForObject("group.getGsum", gno);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return bean;
	}
		
	public boolean joinGroup(int gsum, int gno){		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("gsum", gsum);
				map.put("gno", gno);
		try {
			int t = smc.update("group.join", map);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delGroup(int gno){
		
		try {
			int t = smc.delete("group.delete",gno);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<GroupBean> searchDay(String day){
		List<GroupBean> list = null;
		day = day+"%";
		try {
			list = smc.queryForList("group.selectDay", day);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<GroupBean> joinGx(String id, String gstatus){
		List<GroupBean> gx = null;
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("gstatus", gstatus);
		try {
			gx = smc.queryForList("group.joinGx", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gx;
	}
	public int joinNum(String id){
		int num = 0;
		try {
			num = (int) smc.queryForObject("group.joinNum", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	public List<GroupBean> hostGx(String id){
		List<GroupBean> gx = null;
		try {
			gx = smc.queryForList("group.hostGx", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gx;
	}
	public int hostNum(String id){
		int num = 0;
		try {
			num = (int) smc.queryForObject("group.hostNum", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public boolean joinG(int gsum, int gno, String gstatus){		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
				map.put("gstatus", gstatus);
				map.put("gsum", gsum);
				map.put("gno", gno);
		try {
			int t = smc.update("group.joinG", map);
			if(t==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean endGx(String gstatus){
		int t=0;
		try {
			t = smc.update("group.endGx", gstatus);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(t>1){
			return true;
		}
		return false;
	}
	
	// 태그 검색 결과 조회
	public List<GroupBean> tagResult(String tag){
		List<GroupBean> list=null;
		System.out.println("태그는 "+tag);
		try {
			list = smc.queryForList("group.selectTag", "%#"+tag+"%");
			System.out.println(list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
