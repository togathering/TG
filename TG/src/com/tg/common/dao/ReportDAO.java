package com.tg.common.dao;

import java.sql.SQLException;
import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.ReportBean;
import com.tg.iba.MySqlMapConfig;

public class ReportDAO {
	SqlMapClient smc;
	
	public ReportDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean report(ReportBean bean){
		try {
			smc.insert("report.Add", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean reportEnd(){
		try {
			smc.update("report.End");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public List<ReportBean> reportList(){
		List<ReportBean> list = null;
		String status="N";
		try {
			list = smc.queryForList("report.List", status);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ReportBean reportCon(int no){
		ReportBean bean = null;
		try {
			bean = (ReportBean) smc.queryForObject("report.Con", no);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean reportUp(int no){
		try {
			int t = smc.update("report.Up", no);
			if(t>=1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int reportCount(String id){
		int count = 0;
		try {
			count = (int) smc.queryForObject("report.Count", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}