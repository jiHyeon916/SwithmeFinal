package com.kh.swithme.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.ReReply;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

public interface BoardService {

	

	//혜린 -----------------------------------------------------------------------------------
	
	// 게시글 불러오기
	// 1. 리스트 카운트
	int boardListCount(int boardType);
	
	// 2. 리스트 불러오기
	ArrayList<Board> selectBoardList(int boardType, PageInfo pi);
	
	// 게시글 조회 - 조회수 증가
	int boardCountUp(int boardNo);
	
	// 게시글 조회 - 게시글 카운트
	int freeCount();
	
	// 게시글 상세 조회
	Board boardDetail(int boardNo);
	
	// 게시글 상세 조회 - 좋아요 상태 확인 
	int likeStatus(int boardNo);
	
	// 게시글 상세 조회 - 좋아요 총 수 확인 
	int likeCount(int boardNo);
	
	// 게시글 상세 조회 - 좋아요 하기
	int likeBoard(int boardNo);
	
	// 게시글 상세 조회 - 좋아요 취소 하기
	int removeLike(int boardNo);
	
	// 게시글 상세 조회 - 북마크 상태 확인 
	int bookStatus(int boardNo);

	// 게시글 상세 조회 - 북마크 하기 
	int bookBoard(int boardNo);
	
	// 게시글 상세 조회 - 북마크 취소 하기 
	int removeBook(int boardNo);
	
	// 게시글 상세 조회 - 북마크 총 수 확인 
	int bookCount(int boardNo);
	
	// 게시글 상세 조회 - 댓글 수 확인 
	int replyCount(int boardNo);
	
	// 게시글 상세 조회 - 댓글 리스트 불러오기
	ArrayList<Reply> replyList(int boardNo);
	
	// 대댓글 리스트 불러오기
	ArrayList<ReReply> reReplyList(int replyNo);
		
	// 게시글 상세 조회 - 댓글 작성
	int insertReply(Reply r);
	
	// 게시글 상세 조회 - 대댓글 작성 
	int reReplyBoard(ReReply rere);
	
	// 게시글 작성 
	int test(Board b);
	
	// 태그 인서트 
	int tagInsert(String tagList);
	
	// 태그 검색
	ArrayList<Board> tagSearch(PageInfo pi, Board bSearch);
	
	// 태그 토탈 카운트 
	int tagCount(Board bSearch);
	
	// 카테고리 필터
	ArrayList<Board> categorySearch(Board b, PageInfo pi);
	
	// 글 정렬
	ArrayList<Board> sortSearch(Board b, PageInfo pi);
	
	// 정렬 글 개수 확인 (페이징 처리)
	int searchCount(Board b);
	
	// 게시글 수정 하기 (보드 조회)
	Board boardModifyView(int boardNo);
	
	// 게시글 수정 하기
	int boardModify(Board b);
	
	// 게시글 수정 하기 - 태그 수정하기
	int tagUpdate(Board tag);
	
	// 댓글 수정 하기 ( 댓글 조회)
	Reply replyModifyView(int replyNo);
	
	// 댓글 수정 하기 (업데이트)
	int replyModify(Reply r);
	
	
	
////------------------희재 - 스터디룸 
	// 스터디룸 리스트 카운트
	int sRoomListCount();
	
	// 스터디룸 리스트 불러오기
	ArrayList<StudyRoom> selectSRoomList(PageInfo pi);
	
	// 스터디룸 이미지 불러오기
	ArrayList<Attach> selectSRoomAttachList(int studyRoomNo);
	
	// 스터디름 상세 정보 보기 
	StudyRoom selectStudyRoom(int studyRoomNo);
	
	// 댓글(이용후기) 불러오기
	ArrayList<SRoomReview> selectStudyRoomReviewList(int studyRoomNo);
	
	// 댓글(이용후기) 작성하기
	int insertStudyRoomReview(SRoomReview sr);
	
	// 댓글(이용후기) 불러오기
	SRoomReview selectStudyRoomReview(int reviewNo);
	
	// 댓글(이용후기) 수정하기
	int updateStudyRoomReview(SRoomReview sr);
	
	// 댓글(이용후기) 삭제하기
	int deleteStudyRoomReview(int reviewNo);
	
	// 스터디룸 주소 불러오기
	ArrayList<StudyRoom> selectAddress();
	
	// 스터디룸 검색하기
	ArrayList<StudyRoom> studyRoomSearch(HashMap<String, String> map);
	
	
	
		
}
