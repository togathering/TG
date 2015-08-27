package com.tg.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.QnaBean;
import com.tg.iba.MySqlMapConfig;

public class QnaDAO {
	SqlMapClient smc;
	
	public QnaDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean qnaInsert(QnaBean bean){//문의하기
		try {
			smc.insert("qna.QnaInsert", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<QnaBean> qnaList(String qstatus){
		List<QnaBean> list = null;
		try {
			list = smc.queryForList("qna.QnaList", qstatus);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public QnaBean QnaSelect(int qno){
		QnaBean bean = null;
		try {
			 bean = (QnaBean) smc.queryForObject("qna.QnaSelect", qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public boolean QnaReply(QnaBean bean){
		try {
			int t = smc.update("qna.QnaReply", bean);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<QnaBean> QnaReplyConfirm(String id){
		List<QnaBean> list = null;
		try {
			list = smc.queryForList("qna.QnaReplyConfirm", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
