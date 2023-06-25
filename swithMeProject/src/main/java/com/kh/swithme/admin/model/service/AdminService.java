package com.kh.swithme.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.QNA;


public interface AdminService {
   
   
	  
		//지현
	   
	   //회원들의 count조회(페이징처리)
	   public int selectMemberCount();

	   //회원관리 회원들 조회
	   public ArrayList<Member> adminMemberList(PageInfo pi);

	   // 검색 회원들 count
	   public int selectMemberSearchCount(HashMap<String, String> map);

	   //검색결과 페이징
	   public ArrayList<Member> selectMemberSearchList(HashMap<String, String> map, PageInfo pi);
	   
	   //회원조회
	   public Member memberStatus(String memberId);
	   
	   //회원 정지해제
	   public int memberStopFree(String memberId);
	   
	   //회원 정지
	   public int memberStop(String memberId);
	   
	   
	   //회원 디테일 조회정보(board)
	   public ArrayList<Board> memberDetailBoard(String memberId);
	
	   //회원 디테일 조회정보(band)
	   public ArrayList<Band> memberDetailBand(String memberId);
	   
	   //회원 정보 조회
	    public Member memberInfo(String memberId);
	    
	   //회원 board 글 삭제
	    public int deleteBoardDetail(int boardNo);
	    
	    //회원 band 글 삭제
	    public int deleteBandDetail(int boardNo);
	    
	    //회원 board글 검색(제목으로)
	    public ArrayList<Board> memBoardSearch(HashMap<String, String> map);
	    
	    //회원 board글 검색(내용으로)
	    public ArrayList<Board> memSearchContent(HashMap<String, String> map);
	    
	    //회원 band글 검색(제목으로)
	    public ArrayList<Band> memBandSearchTitle(HashMap<String,String> map);
	    
	    //회원 band글 검색(내용으로)
	    public ArrayList<Band> memBandSearchContent(HashMap<String, String> map);
   
   
   // 이유진 ----------------------------------------
   
   // 문의글 리스트 조회 + 페이징처리
	// 모든 문의글 수 가져오기
	int selectQnaListCount(String qnaStatus);
	// 모든 문의글 리스트 조회
	ArrayList<QNA> selectQnaList(PageInfo pi, String qnaStatus);
	
	// 문의글 답변 INSERT
	int insertQnaReply(QNAReply qr);
	
	// 문의글 답변 목록 출력
	ArrayList<QNAReply> selectQnaReply(int qnaNo);
	
	// 문의글 답변여부 상태변화
	int qnaStatusUpdate(int qnaNo);
	
	// 문의글 답변 삭제
	int qnaReplyDelete(int qnaNo);
	
	// 아이템 등록
	int insertItem(Item item);
	
	// 아이템 전체수
	int selectItemListCount(Item item);
	
	// 아이템 리스트 조회
	ArrayList<Item> selectItemList(PageInfo pi, Item item);
	
	// 아이템 상태 업데이트
	int itemStatusUpdate(Item item);
	
	// 아이템 수정
	int itemUpdate(Item item);
		
	

	
	
	
	// 희재 -----------------------------------------------------
	// 스터디룸 
	// 스터디룸 리스트 전체 count
	int adminStudyRoomListCount();
	// 스터디룸 전체 리스트 조회
	ArrayList<StudyRoom> selectAllStudyRoomList(PageInfo pi);
   
	// 스터디룸 추가
	int insertStudyRoom(StudyRoom sr);
	
	// 스터디룸 위치 추가
	int insertStudyRoomImage(Attach at);
	
	// 스터디룸 선택 삭제
	int deleteCheckStudyRoom(int studyRoomNo);
	
	// 스터디룸 상세보기 삭제
	int deleteStudyRoom(int studyRoomNo);
	
	// 스터디룸 상세보기
	StudyRoom selectStudyRoom(int studyRoomNo);
	ArrayList<Attach> selectStudyRoomImage(int studyRoomNo);
	
	// 스터디룸 정보 수정
	int updateStudyRoom(StudyRoom sr);
	int updateStudyRoomImage(Attach at);
	
	
}