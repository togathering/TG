package com.tg.common.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.NoteBean;

public class NoteDAO{
	
	@Autowired
	SqlSession session;

	public List<NoteBean> selectNote(String receiverId, int start, int limit){
		return session.selectList("note.select", receiverId, new RowBounds(start, limit));
	}
	
	public int selectNoteCount(String receiverId){
		return session.selectOne("note.selectNoteCount", receiverId);
	}
	
	public boolean insertNote(NoteBean bean){
		if(session.insert("note.insert", bean)==1) return true;
		else return false;
	}
	
	public NoteBean detailNote(int noteNo){
		return (NoteBean) session.selectOne("note.detail", noteNo);
	}
	
	public boolean deleteNote(int noteNo){
		if(session.delete("note.delete", noteNo)==1) return true;
		else return false;
	}
}
