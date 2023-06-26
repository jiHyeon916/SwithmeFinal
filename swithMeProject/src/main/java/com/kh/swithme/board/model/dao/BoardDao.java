package com.kh.swithme.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.admin.model.vo.Report;
import com.kh.swithme.band.model.vo.Band;
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
	public ArrayList<Board> topBoard(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("boardMapper.topBoard");
	}
	public ArrayList<Board> topBoard2(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("boardMapper.topBoard2");
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
	public int likeStatus(SqlSessionTemplate sqlSession, Board bBoard) {
		return sqlSession.selectOne("boardMapper.likeStatus", bBoard);
	}
	public int likeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.likeCount", boardNo);
	}
	public int likeBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.likeBoard", b);
	}
	public int removeLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.delete("boardMapper.removeLike", b);
	}
	public int bookStatus(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.bookStatus", b);
	}
	public int bookBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.bookBoard", b);
	}
	public int removeBook(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.delete("boardMapper.removeBook", b);
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
	public int insertReplyAlarm(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.insert("boardMapper.insertReplyAlarm", boardNo);
	}
	public int reReplyBoard(SqlSessionTemplate sqlSession, ReReply rere) {
		return sqlSession.insert("boardMapper.reReplyBoard", rere);
	}
	public int reReplyBoardAlarm(SqlSessionTemplate sqlSession, ReReply rere) {
		return sqlSession.insert("boardMapper.reReplyBoardAlarm", rere);
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
	public int reReplyModify(SqlSessionTemplate sqlSession, ReReply re) {
		return sqlSession.update("boardMapper.reReplyModify", re);
	}
	public int replyDelete(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.replyDelete", replyNo);
	}
	public int studyBandInsert(SqlSessionTemplate sqlSession, Band b) {
		return sqlSession.insert("boardMapper.studyBandInsert", b);
	}
	public int studyMemberInsert(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.insert("boardMapper.studyMemberInsert", memberId);
	}
	public int boardCategoryCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("boardMapper.boardCategoryCount", category);
	}
	public ArrayList<Board> bandCateogoryList(SqlSessionTemplate sqlSession, String category, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.bandCateogoryList", category, rowBounds);
	}
	public ArrayList<Band> bandSearch(SqlSessionTemplate sqlSession, String key, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.bandSearch", key, rowBounds);
	}
	public int bandSearchCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("boardMapper.boardCategoryCount", category);
	}
	public Reply selectioncheck(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectioncheck", boardNo);
	}
	public int selectInsert(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.insert("boardMapper.selectInsert", replyNo);
	}
	public int selectPoint(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.insert("boardMapper.selectPoint", replyNo);
	}
	public ArrayList<Item> itemBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.itemBoard");
	}
	public int itemCheck(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.itemCheck", b);
	}
	public int itembuyPoint(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.itembuyPoint", b);
	}
	public int itemGet(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.itemGet", b);
	}
	public ArrayList<Item> itemListUpdate(SqlSessionTemplate sqlSession, String category) {
		return (ArrayList)sqlSession.selectList("boardMapper.itemListUpdate", category);
	}
	public int boardReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("boardMapper.boardReport", r);
	}
	public int deleteRe(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.deleteRe", r);
	}

	public ArrayList<Item> itemSearch(SqlSessionTemplate sqlSession, String key) {
		return (ArrayList)sqlSession.selectList("boardMapper.itemSearch", key);
	}
	public int rereplyCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.rereplyCount", boardNo);
	}
	public ArrayList<Item> memberImg(SqlSessionTemplate sqlSession, String memberId) {
		return (ArrayList)sqlSession.selectList("boardMapper.memberImg", memberId);
	}
	public Board boardlist(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.boardlist", boardNo);
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

	public ArrayList<StudyRoom> selectAddressSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("boardMapper.selectAddressSearch", map);
	}





	// ******* 메인 
	public ArrayList<Band> mainStudy(SqlSessionTemplate sqlSession, String category) {
		return (ArrayList)sqlSession.selectList("boardMapper.mainStudy", category);
	}







}
