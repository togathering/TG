package com.tg.common.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
			list = session.selectList("group.list", order, new RowBounds(0, pageCnt));

		return list;
	}
	
	public List<GroupBean> mainList(){
		List<GroupBean> list = null;

			list = session.selectList("group.mainlist","",new RowBounds(0, 6));

		return list;
	}
	
	public List<GroupBean> mSelectAll(){
		List<GroupBean> list = null;

			 list = session.selectList("admin.showAllGroup");

		return list;
	}
	
	public List<GroupBean> search(String keyword, String order, int pageCnt){
		List<GroupBean> list = null;

			keyword = "%"+keyword+"%";
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
			map.put("order", order);
			list =  session.selectList("group.search", map, new RowBounds(0, pageCnt));

		return list;
	}
	
	public List<GroupBean> mSearchTitle(String gtitle){
		List<GroupBean> list = null;
		gtitle="%"+gtitle+"%";

			list=session.selectList("group.MsearchTitle",gtitle);

		return list;
	}
	
	// ���� : �������� ����
	public GroupBean selectGroupInfo(int gno){
		GroupBean bean = null;

			bean = (GroupBean)session.selectOne("group.info", gno);
					
		return bean;
	}
	
	public GroupBean wantGsum(int gno){
		GroupBean bean = null;
			
			bean = (GroupBean) session.selectOne("group.getGsum", gno);
		
			return bean;
	}
		
	public boolean joinGroup(int gsum, int gno){		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("gsum", gsum);
				map.put("gno", gno);

			int t = session.update("group.join", map);
			if(t==1){
				return true;
			}
		
		return false;
	}
	
	public boolean delGroup(int gno){
		
			int t = session.delete("group.delete",gno);
			if(t==1){
				return true;
			}
		
		return false;
	}
	
	public List<GroupBean> searchDay(String day, int pageCnt){
		List<GroupBean> list = null;
		day = day+"%";

			list = session.selectList("group.selectDay", day, new RowBounds(0, pageCnt));
		
		return list;
	}
	
	public List<GroupBean> joinGx(String id, String gstatus){
		List<GroupBean> gx = null;
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("gstatus", gstatus);

			gx = session.selectList("group.joinGx", map);
		
		return gx;
	}
	public int joinNum(String id){
		int num = 0;
		
			num = (int) session.selectOne("group.joinNum", id);
		
		return num;
	}
	public List<GroupBean> hostGx(String id, String gstatus){
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("gstatus", gstatus);
		List<GroupBean> gx = null;
		
			gx = session.selectList("group.hostGx", map);
		
		return gx;
	}
	public int hostNum(String id){
		int num = 0;
		
			num = (int) session.selectOne("group.hostNum", id);
		
		return num;
	}
	
	public boolean joinG(int gsum, int gno, String gstatus){		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
				map.put("gstatus", gstatus);
				map.put("gsum", gsum);
				map.put("gno", gno);
		
			int t = session.update("group.joinG", map);
			if(t==1){
				return true;
			}
		
		return false;
	}
	
	public boolean endGx(String gstatus){
		int t=0;
		
			t = session.update("group.endGx", gstatus);
		
		if(t>1){
			return true;
		}
		return false;
	}
	
	// �±� �˻� ��� ��ȸ
	public List<GroupBean> tagResult(String tag){
		List<GroupBean> list=null;
		System.out.println("�±״� "+tag);
		
			list = session.selectList("group.selectTag", "%#"+tag+"%");
			System.out.println(list.size());
		
		return list;
	}
}
