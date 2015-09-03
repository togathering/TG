package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.ReportBean;

public class ReportDAO {
	@Autowired
	SqlSession session;
	
	public ReportDAO() {
	}
	
	public boolean report(ReportBean bean){
		int t = session.insert("report.Add", bean);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public boolean reportEnd(){
		int t = session.update("report.End");
		if(t==1){
			return true;
		}
		return false;
	}
	public List<ReportBean> reportList(){
		String status="N";
		List<ReportBean> list = session.selectList("report.List", status);
		return list;
	}
	public ReportBean reportCon(int no){
		ReportBean bean = session.selectOne("report.Con", no);
		return bean;
	}
	public boolean reportUp(int no, String status){
		System.out.println("no:"+no+", status:"+status);
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("status", status);
		int t = session.update("report.Up", map);
		if(t==1) {
			return true;
		}
		return false;
	}
	
	public int reportCount(String id){
		int count = session.selectOne("report.Count", id);
		return count;
	}
}