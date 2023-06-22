package com.kh.swithme.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.admin.model.vo.Report;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.dao.BoardDao;
import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.ReReply;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {


	@Autowired
	private BoardDao boardDao;

	@Autowired
	private SqlSessionTemplate sqlSession;






	//혜린 -----------------------------------------------------------------------------------
	
	@Override
	public int boardListCount(int boardType) {
		return boardDao.boardListCount(sqlSession, boardType);
	}
	@Override
	public ArrayList<Board> selectBoardList(int boardType, PageInfo pi) {
		return boardDao.boardListSelect(sqlSession, pi, boardType);
	}
	@Override
	public ArrayList<Board> topBoard(){
		return boardDao.topBoard(sqlSession);
	}
	@Override
	public ArrayList<Board> topBoard2(){
		return boardDao.topBoard2(sqlSession);
	}
	@Override
	public int boardCountUp(int boardNo) {
		return boardDao.boardCountUp(sqlSession, boardNo);
	}
	@Override
	public int boardCount(int boardType) {
		return boardDao.boardCount(sqlSession, boardType);
	}
	@Override
	public Board boardDetail(int boardNo) {
		return boardDao.boardDetail(sqlSession, boardNo);
	}
	@Override
	public int likeStatus(Board bBoard) {
		return boardDao.likeStatus(sqlSession, bBoard);
	}
	@Override
	public int likeCount(int boardNo) {
		return boardDao.likeCount(sqlSession, boardNo);
	}
	@Override
	public int likeBoard(Board b) {
		return boardDao.likeBoard(sqlSession, b);
	}
	@Override
	public int removeLike(Board b) {
		return boardDao.removeLike(sqlSession, b);
	}
	@Override
	public int bookStatus(Board b) {
		return boardDao.bookStatus(sqlSession, b);
	}
	@Override
	public int bookBoard(Board b) {
		return boardDao.bookBoard(sqlSession, b);
	}
	@Override
	public int removeBook(Board b) {
		return boardDao.removeBook(sqlSession, b);
	}
	@Override
	public int bookCount(int boardNo) {
		return boardDao.bookCount(sqlSession, boardNo);
	}
	@Override
	public int replyCount(int boardNo) {
		return boardDao.replyCount(sqlSession, boardNo);
	}
	@Override
	public ArrayList<Reply> replyList(int boardNo) {
		return boardDao.replyList(sqlSession, boardNo);
	}
	@Override
	public ArrayList<ReReply> reReplyList(int replyNo) {
		return boardDao.reReplyList(sqlSession, replyNo);
	}
	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}
	@Override
	public int insertReplyAlarm(int boardNo) {
		return boardDao.insertReplyAlarm(sqlSession, boardNo);
	}
	@Override
	public int reReplyBoard(ReReply rere) {
		return boardDao.reReplyBoard(sqlSession, rere);
	}
	@Override
	public int reReplyBoardAlarm(ReReply rere) {
		return boardDao.reReplyBoardAlarm(sqlSession, rere);
	}
	@Override
	public int test(Board b) {
		return boardDao.test(sqlSession, b);
	}
	@Override
	public int tagInsert(String tagList) {
		return boardDao.tagInsert(sqlSession, tagList);
	}
	@Override
	public ArrayList<Board> tagSearch(PageInfo pi, Board bSearch) {
		return boardDao.tagSearch(sqlSession, pi, bSearch);
	}
	@Override
	public int tagCount(Board bSearch) {
		return boardDao.tagCount(sqlSession, bSearch);
	}
	@Override
	public ArrayList<Board> categorySearch(Board b, PageInfo pi) {
		return boardDao.categorySearch(sqlSession, b, pi);
	}
	@Override
	public ArrayList<Board> sortSearch(Board b, PageInfo pi) {
		return boardDao.sortSearch(sqlSession, b, pi);
	}
	@Override
	public int searchCount(Board b) {
		return boardDao.searchCount(sqlSession, b);
	}
	@Override
	public Board boardModifyView(int boardNo) {
		return boardDao.boardModifyView(sqlSession, boardNo);
	}
	@Override
	public int boardModify(Board b) {
		return boardDao.boardModify(sqlSession, b);
	}
	@Override
	public int tagUpdate(Board tag) {
		return boardDao.tagUpdate(sqlSession, tag);
	}
	@Override
	public int boardDelete(int boardNo) {
		return boardDao.boardDelete(sqlSession, boardNo);
	}
	@Override
	public Reply replyModifyView(int replyNo) {
		return boardDao.replyModifyView(sqlSession, replyNo);
	}
	@Override
	public int reReplyModify(ReReply re) {
		return boardDao.reReplyModify(sqlSession, re);
	}
	@Override
	public int replyModify(Reply r) {
		return boardDao.replyModify(sqlSession, r);
	}
	@Override
	public int replyDelete(int replyNo) {
		return boardDao.replyDelete(sqlSession, replyNo);
	}
	@Override
	public int studyBandInsert(Band b) {
		return boardDao.studyBandInsert(sqlSession, b);
	}
	@Override
	public int studyMemberInsert(String memberId) {
		return boardDao.studyMemberInsert(sqlSession, memberId);
	}
	@Override
	public int boardCategoryCount(String category) {
		return boardDao.boardCategoryCount(sqlSession, category);
	}
	@Override
	public ArrayList<Board> bandCateogoryList(String category, PageInfo pi) {
		return boardDao.bandCateogoryList(sqlSession, category, pi);
	}
	@Override
	public ArrayList<Band> bandSearch(String key, PageInfo pi) {
		return boardDao.bandSearch(sqlSession, key, pi);
	}
	@Override
	public int bandSearchCount(String key) {
		return boardDao.bandSearchCount(sqlSession, key);
	}
	@Override
	public Reply selectioncheck(int boardNo) {
		return boardDao.selectioncheck(sqlSession, boardNo);
	}
	@Override
	public int selectInsert(int replyNo) {
		return boardDao.selectInsert(sqlSession, replyNo);
	}
	@Override
	public int selectPoint(int replyNo) {
		return boardDao.selectPoint(sqlSession, replyNo);
	}
	@Override
	public ArrayList<Item> itemBoard() {
		return boardDao.itemBoard(sqlSession);
	}
	@Override
	public int itemCheck(Board b) {
		return boardDao.itemCheck(sqlSession, b);
	}
	@Override
	public int itembuyPoint(Board b) {
		return boardDao.itembuyPoint(sqlSession, b);
	}
	@Override
	public int itemGet(Board b) {
		return boardDao.itemGet(sqlSession, b);
	}
	@Override
	public ArrayList<Item> itemListUpdate(String category) {
		return boardDao.itemListUpdate(sqlSession, category);
	}
	@Override
	public int boardReport(Report r) {
		return boardDao.boardReport(sqlSession, r);
	}
	@Override
	public int deleteRe(Reply r) {
		return boardDao.deleteRe(sqlSession, r);
	}
	@Override
	public ArrayList<Item> itemSearch(String key) {
		return boardDao.itemSearch(sqlSession, key);
	}
	@Override
	public int rereplyCount(int boardNo) {
		return boardDao.rereplyCount(sqlSession, boardNo);
	}
	
	
	// ************* 메인 
	@Override
	public ArrayList<Band> mainStudy(String category) {
		return boardDao.mainStudy(sqlSession, category);
	}




	// 희재 - 스터디룸 

	@Override
	public int sRoomListCount() {
		return boardDao.sRoomListCount(sqlSession);
	}

	@Override
	public ArrayList<StudyRoom> selectSRoomList(PageInfo pi) {
		return boardDao.selectSRoomList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attach> selectSRoomAttachList(int studyRoomNo) {
		return boardDao.selectSRoomAttachList(sqlSession, studyRoomNo);
	}

	@Override
	public StudyRoom selectStudyRoom(int studyRoomNo) {
		return boardDao.selectStudyRoom(sqlSession, studyRoomNo);
	}

	@Override
	public ArrayList<SRoomReview> selectStudyRoomReviewList(int studyRoomNo) {
		return boardDao.selectStudyRoomReviewList(sqlSession, studyRoomNo);
	}

	@Override
	public int insertStudyRoomReview(SRoomReview sr) {
		return boardDao.insertStudyRoomReview(sqlSession, sr);
	}

	@Override
	public SRoomReview selectStudyRoomReview(int reviewNo) {
		return boardDao.selectStudyRoomReview(sqlSession, reviewNo);
	}

	@Override
	public int updateStudyRoomReview(SRoomReview sr) {
		return boardDao.updateStudyRoomReview(sqlSession, sr);
	}

	@Override
	public int deleteStudyRoomReview(int reviewNo) {
		return boardDao.deleteStudyRoomReview(sqlSession, reviewNo);
	}
	@Override
	public ArrayList<StudyRoom> selectAddress() {
		return boardDao.selectAddress(sqlSession);
	}
	@Override
	public ArrayList<StudyRoom> studyRoomSearch(HashMap<String, String> map) {
		return boardDao.studyRoomSearch(sqlSession, map);
	}
	
	
	
	



}
