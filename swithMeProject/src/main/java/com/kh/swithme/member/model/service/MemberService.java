package com.kh.swithme.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.BandBookMark;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.MemberItem;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;
import com.kh.swithme.member.model.vo.TodoList;

public interface MemberService {
	
	//지현
	//아이디 중복체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nickCheck(String checkNick);
	
	//이메일 중복체크
	int emailCheck(String checkEmail);
	
	//회원가입
	int joinMember(Member m);
	
	//회원가입 시 포인트 insert
	int joinPoint(Member m);

	//로그인
	Member loginMember(Member m);

   //회원 포인트 체크  select
   int loginPointChk(Member m);

   //회원 포인트 insert
   int loginPointInsert(Member m);
   
   // 아이디 찾기 
   Member memberSerchId(Member m);
   
   //로그아웃
   int deleteMember(String userId);
  
   //패스워드 체크  ???
   int memberPwdChk(Member m);
   
   
   //수정하기
   int updateMember(Member m);

   //비밀번호 찾기 
   Member memberSearchPwd(Member m);
   
   //이메일 보내기 
   void sendMailInsert(Member m);
   
   
   //알람 조회
  	ArrayList<Alarm> selectAlarmList(String memberId);
   
   //알람 읽음여부 - 게시판
  	int readAlarm(HashMap<String, Integer> map);
  
  	//알람 읽음여부 - 밴드
  	int readAlarmB(HashMap<String, Integer> map);
  	

  

   
   
   
  //----------------------희재
  	 //calendar 조회
  	 	ArrayList<Calendar> selectMyCalendarlList(String memberId);
  	 	
  	 	// calendar - 일정 추가
  	 	int addSchedule(Calendar cl);
  	 	
  	 	// calendar - 일정 삭제
  	 	int deleteSchedule(Calendar cl);
  	 	
  	 	// calendar - 일정 수정
  	 	int updateSchedule(Calendar cl);
  	 	
  	 	// todoList
  	 	// todoList 조회(캘린더, 리스트)
  	 	ArrayList<TodoList> selectTodoListAll(TodoList td);
  	 	ArrayList<TodoList> selectTodoListTodo(TodoList td);
  	 	ArrayList<TodoList> selectTodoListComplete(TodoList td);
  	 	ArrayList<TodoList> todoAchievementRateList(String memberId);
  	 	
  	 	// 완료 카운트
  	 	int completeTodo(int todoNo);
  	 	
  	 	//todoList 추가
  	 	int insertTodoList(TodoList td);
  	 	
  	 	//todoList 체크
  	 	int checkTodoList(int todoNo);
  	 	
  	 	//todoList uncheck
  	 	int uncheckTodoList(int todoNo);
  	 	
  	 	// todoList 삭제
  	 	int deleteTask(TodoList td);
  	 	
  	 	// todoList 수정
  	 	int updateTodoList(TodoList td);
  	 	
  	 	// 마이페이지-스터디밴드
  	 	ArrayList<Band> allStudyBandList(String memberId);
  	 	
  	 	// 마이페이지-스터디밴드
  	 	ArrayList<Band> favoriteStudyBand(String memberId);
  	 	
  	 	// 마이페이지 - 스터디밴드 북마크 유무 조회
  	 	int selectSbandBookmark(BandBookMark bm);
  	 	
  	 	// 마이페이지-스터디밴드 북마크 추가
  	 	int insertSbandBookmark(BandBookMark bm);
  	 	
  	 	//마이페이지-스터디밴드 북마크 삭제
  	 	int deleteSbandBookmark(BandBookMark bm);
  	 	
  	 	//마이페이지-북마크 Count
  	 	int selectBookMarkListCount(String memberId);
  	 	
  	 	//마이페이지-북마크 리스트 조회
  	 	ArrayList<Board> selectBoardBookMarkList(String memberId, PageInfo pi);
  	 	
  	 	//마이페이지-북마크 삭제
  	 	int deleteBoardBookMark(int boardNo);
	
	
 	
 	
	
	
	
	// 이유진 -----------------------------------------------------------------------------------
	
	// 토탈포인트(사용가능한 포인트)
	int selectTotalPoint(String memberId);
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	ArrayList<Point> selectPointList3(String memberId);
	
	// 사용자의 포인트 내역 수 가져오기
	int myPointListCount(String memberId);
	
	// 사용자의 포인트 리스트 조회
	ArrayList<Point> myPointList(PageInfo pi, String memberId);
	
	// 오늘 얻은 포인트 가져오기(적립내용만)
	int todayPoint(String memberId);
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	ArrayList<Alarm> selectAlarmList5(String memberId);
	
	// 사용자가 작성한 게시글 수 가져오기
	int myBoardListCount(Board b);
	
	// 사용자가 작성한 게시글 리스트 조회
	ArrayList<Board> myBoardList(PageInfo pi, Board b);
	
	// 사용자가 작성한 댓글 수 가져오기
	int myReplyListCount(Reply r);
	
	// 사용자가 작성한 댓글 리스트 조회
	ArrayList<Reply> myReplyList(PageInfo pi, Reply r);

	// 사용자가 작성한 문의글 수 가져오기
	int selectQnaListCount(QNA qna);
	
	// 사용자가 작성한 문의글 리스트 조회
	ArrayList<QNA> selectQnaList(PageInfo pi, QNA qna);
	
	// 문의글 작성하기
	int insertQna(QNA qna);
	
	// 작성한 문의글 번호 가져오기
	QNA selectQnaNo(String memberId);
	
	// 문의글 상세보기
	QNA qnaDetailView(int qno);
	
	// 문의글 삭제하기
	int qnaDelete(int qno);

	// 회원가입시 기본 캐릭터 지급
	int	defaultCharacter(Member m);
	
	// 회원가입시 기본 배경 지급
	int	defaultBackground(Member m);
	
	// 보유 아이템 리스트 카운트
	int myItemListCount(MemberItem mItem);
	
	// 보유 아이템 리스트
	ArrayList<Item> myItemList(PageInfo pi, MemberItem mItem);

	// 보유 아이템 삭제
	int deleteMyItem(MemberItem mitem);
	
	// 착용한 아이템 가져오기
	ArrayList<Item> myCharacter(String memberId);

	// 착용상태 변경
	int wearStatusUpdate(MemberItem mItem);

	// 마이페이지 메인 - 작성글 리스트(최신 5개)
	ArrayList<Board> mainPostList(String memberId);
	
	
	
	  
}
