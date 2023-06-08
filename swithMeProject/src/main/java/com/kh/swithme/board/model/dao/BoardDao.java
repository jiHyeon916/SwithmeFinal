package com.kh.swithme.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.ReReply;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	
	//혜린 -----------------------------------------------------------------------------------
	public int boardListCount(SqlSessionTemplate sqlSession, int boardType) {
		return sqlSession.selectOne("boardMapper.boardListCount", boardType);
	}
	public ArrayList<Board> boardListSelect(SqlSessionTemplate sqlSession, PageInfo pi, int boardType){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.boardListSelect", boardType, rowBounds);
	}
	public int boardCountUp(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.boardCountUp", boardNo);
	}
	public int freeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.freeCount");
	}
	public Board boardDetail(SqlSessionTemplate sqlSession, int boardNo){
		return sqlSession.selectOne("boardMapper.boardDetail", boardNo);
	}
	public int likeStatus(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.likeStatus", boardNo);
	}
	public int likeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.likeCount", boardNo);
	}
	public int likeBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.insert("boardMapper.likeBoard", boardNo);
	}
	public int removeLike(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.removeLike", boardNo);
	}
	public int bookStatus(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.bookStatus", boardNo);
	}
	public int bookBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.insert("boardMapper.bookBoard", boardNo);
	}
	public int removeBook(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.removeBook", boardNo);
	}
	public int bookCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.bookCount", boardNo);
	}
	public int replyCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.replyCount", boardNo);
	}
	public ArrayList<Reply> replyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.replyList",boardNo);
	}
	public ArrayList<ReReply> reReplyList(SqlSessionTemplate sqlSession, int replyNo){
		return (ArrayList)sqlSession.selectList("boardMapper.reReplyList", replyNo);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	public int reReplyBoard(SqlSessionTemplate sqlSession, ReReply rere) {
		return sqlSession.insert("boardMapper.reReplyBoard", rere);
	}
	
	
	
	
	// 희재 스터디룸 ------------------------------------------------------------------------
	public int sRoomListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.sRoomListCount");
	}
	
	public ArrayList<StudyRoom> selectSRoomList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSRoomList", rowBounds);
	}
	
	public StudyRoom selectStudyRoom(SqlSessionTemplate sqlSession, int studyRoomNo) {
		return sqlSession.selectOne("boardMapper.selectStudyRoom", studyRoomNo);
	}
	
	public ArrayList<SRoomReview> selectStudyRoomReviewList(SqlSessionTemplate sqlSession, int studyRoomNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectStudyRoomReviewList", studyRoomNo);
	}
	
	public int insertStudyRoomReview(SqlSessionTemplate sqlSession, SRoomReview sr) {
		return sqlSession.insert("boardMapper.insertStudyRoomReview", sr);
	}
}
