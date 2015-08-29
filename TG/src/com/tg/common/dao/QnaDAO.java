package com.tg.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.QnaBean;

public class QnaDAO {
	@Autowired
	SqlSession session;
	
	public QnaDAO() {
	}
	
	public boolean qnaInsert(QnaBean bean){//문의하기
		int t = session.insert("qna.QnaInsert", bean);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public List<QnaBean> qnaList(String qstatus){
		List<QnaBean> list = session.selectList("qna.QnaList", qstatus);
		return list;
	}
	
	public QnaBean QnaSelect(int qno){
		QnaBean bean = session.selectOne("qna.QnaSelect", qno);
		return bean;
	}
	
	public boolean QnaReply(QnaBean bean){
			int t = session.update("qna.QnaReply", bean);
			if(t==1) {
				return true;
			}
		return false;
	}
	
	public List<QnaBean> QnaReplyConfirm(String id){
		List<QnaBean> list = session.selectList("qna.QnaReplyConfirm", id);
		return list;
	}
}
