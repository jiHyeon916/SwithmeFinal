package com.kh.swithme.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.board.model.vo.Attach;
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
	public int boardCount(SqlSessionTemplate sqlSession, int boardType) {
		return sqlSession.selectOne("boardMapper.boardCount", boardType);
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
	public int tagInsert(SqlSessionTemplate sqlSession, String tagList) {
		return sqlSession.insert("boardMapper.tagInsert", tagList);
	}
	
	public int test(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.test", b);
	}
	public ArrayList<Board> tagSearch(SqlSessionTemplate sqlSession, PageInfo pi, Board bSearch) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.tagSearch", bSearch, rowBounds);
	}
	public int tagCount(SqlSessionTemplate sqlSession, Board bSearch) {
		return sqlSession.selectOne("boardMapper.tagCount", bSearch);
	}
	public ArrayList<Board> categorySearch(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.categorySearch", b, rowBounds);
	}
	public ArrayList<Board> sortSearch(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.sortSearch", b, rowBounds);
	}
	public int searchCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.searchCount", b);
	}
	public Board boardModifyView(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.boardModifyView", boardNo);
	}
	public int boardModify(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.boardModify", b);
	}
	public int tagUpdate(SqlSessionTemplate sqlSession, Board tag) {
		return sqlSession.update("boardMapper.tagUpdate", tag);
	}
	public int boardDelete(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.boardDelete", boardNo);
	}
	public Reply replyModifyView(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("boardMapper.replyModifyView", replyNo);
	}
	public int replyModify(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.replyModify", r);
	}
	public int studyBandInsert(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.studyBandInsert", b);
	}
	public int studyMemberInsert(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.insert("boardMapper.studyMemberInsert", memberId);
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

	public ArrayList<Attach> selectSRoomAttachList(SqlSessionTemplate sqlSession, int studyRoomNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectSRoomAttachList", studyRoomNo);
	}

	public ArrayList<SRoomReview> selectStudyRoomReviewList(SqlSessionTemplate sqlSession, int studyRoomNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectStudyRoomReviewList", studyRoomNo);
	}

	public int insertStudyRoomReview(SqlSessionTemplate sqlSession, SRoomReview sr) {
		return sqlSession.insert("boardMapper.insertStudyRoomReview", sr);
	}

	public SRoomReview selectStudyRoomReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.selectOne("boardMapper.selectStudyRoomReview", reviewNo);
	}

	public int updateStudyRoomReview(SqlSessionTemplate sqlSession, SRoomReview sr) {
		return sqlSession.update("boardMapper.updateStudyRoomReview", sr);
	}

	public int deleteStudyRoomReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("boardMapper.deleteStudyRoomReview",reviewNo);
	}

	public ArrayList<StudyRoom> selectAddress(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectAddress");
	}
	
	public ArrayList<StudyRoom> studyRoomSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("boardMapper.studyRoomSearch", map);
	}
	
}
