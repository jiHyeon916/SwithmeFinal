package com.kh.swithme.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	
	
	
	
	// 혜린
	
	@Override
	public int boardListCount(int boardType) {
		return boardDao.boardListCount(sqlSession, boardType);
	}
	@Override
	public ArrayList<Board> selectBoardList(int boardType, PageInfo pi) {
		return boardDao.boardListSelect(sqlSession, pi, boardType);
	}
	@Override
	public int boardCountUp(int boardNo) {
		return boardDao.boardCountUp(sqlSession, boardNo);
	}
	@Override
	public int freeCount() {
		return boardDao.freeCount(sqlSession);
	}
	@Override
	public Board boardDetail(int boardNo) {
		return boardDao.boardDetail(sqlSession, boardNo);
	}
	@Override
	public int likeStatus(int boardNo) {
		return boardDao.likeStatus(sqlSession, boardNo);
	}
	@Override
	public int likeCount(int boardNo) {
		return boardDao.likeCount(sqlSession, boardNo);
	}
	@Override
	public int likeBoard(int boardNo) {
		return boardDao.likeBoard(sqlSession, boardNo);
	}
	@Override
	public int removeLike(int boardNo) {
		return boardDao.removeLike(sqlSession, boardNo);
	}
	@Override
	public int bookStatus(int boardNo) {
		return boardDao.bookStatus(sqlSession, boardNo);
	}
	@Override
	public int bookBoard(int boardNo) {
		return boardDao.bookBoard(sqlSession, boardNo);
	}
	@Override
	public int removeBook(int boardNo) {
		return boardDao.removeBook(sqlSession, boardNo);
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
	public int reReplyBoard(ReReply rere) {
		return boardDao.reReplyBoard(sqlSession, rere);
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
		return null;
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
	
}
