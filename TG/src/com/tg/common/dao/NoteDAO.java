package com.tg.common.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.NoteBean;
import com.tg.iba.MySqlMapConfig;

public class NoteDAO {
	
	@Autowired
	SqlSession session;

	public List<NoteBean> selectNote(String receiverId){
		List<NoteBean> list = session.selectList("note.select", receiverId);
		return list;
	}

	
	public boolean insertNote(NoteBean bean){
		int t = session.insert("note.insert", bean);
		if(t==1) return true;
		else return false;
	}

	
	public NoteBean detailNote(int noteNo){
		System.out.println("디테일노트() 메소드 실행");
		NoteBean bean = (NoteBean) session.selectOne("note.detail", noteNo);
		System.out.println("닉네임 테스트" + bean.getNick());
		return bean;
	}
	
	public boolean deleteNote(int noteNo){
		int t = session.delete("note.delete", noteNo);
		System.out.println("삭제된 행의 갯수는 " +t);
		if(t==1) return true;
		else return false;
	}
}
