package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.GroupBean;

public class GroupDAO {
	
	@Autowired
	SqlSession session;
	
	public GroupDAO() {
				
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
	
	public List<GroupBean> conditionSearch(String keyword, String order, int pageCnt, String gday){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "%"+keyword+"%");
		map.put("gday", gday+"%");
		map.put("order", order);
		List<GroupBean> list = session.selectList("group.conditionSearch", map, new RowBounds(0, pageCnt));
		return list;
	}
	
	public List<GroupBean> mSearchTitle(String gtitle){
		List<GroupBean> list = null;
		gtitle="%"+gtitle+"%";

			list=session.selectList("group.MsearchTitle",gtitle);

		return list;
	}
	
	// 명준 : 상세페이지 보기
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
	
	public List<GroupBean> joinGxEnd(String id){
		List<GroupBean> gx = null;

		gx = session.selectList("group.joinGxEnd", id);
		
		return gx;
	}
	
	public List<GroupBean> joinGx(String id){
		List<GroupBean> gx = null;

		gx = session.selectList("group.joinGx", id);
		
		return gx;
	}
	
	public int joinNum(String id){
		int num = 0;
		
			num = (int) session.selectOne("group.joinNum", id);
		
		return num;
	}
	public List<GroupBean> hostGx(String id){
		List<GroupBean> gx = session.selectList("group.hostGx", id);
		return gx;
	}
	
	public List<GroupBean> hostGxEnd(String id){
		List<GroupBean> gx = session.selectList("group.hostGxEnd", id);
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
	
	// 태그 검색 결과 조회
	public List<GroupBean> tagResult(String tag){
		List<GroupBean> list=null;
		System.out.println("태그는 "+tag);
		
			list = session.selectList("group.selectTag", "%#"+tag+"%");
			System.out.println(list.size());
		
			
		return list;
	}

	public List<GroupBean> conditionSearch(String keyword, String order,
			Integer cnt, String gday) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "%"+keyword+"%");
		map.put("gday", gday+"%");
		map.put("order", order);
		List<GroupBean> list = session.selectList("group.conditionSearch", map, new RowBounds(0, cnt));
		return list;
	}
	
	public GroupBean recommend(int gno){
		GroupBean bean = session.selectOne("group.recommend",gno);
		return bean;
	}
}
