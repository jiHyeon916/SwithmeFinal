package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;
import com.kh.swithme.member.model.vo.TodoList;

public interface MemberService {
	
	
	//�븘�씠�뵒 以묐났 泥댄겕
	int idCheck(String checkId);
	
	//�땳�꽕�엫 以묐났泥댄겕
	int nickCheck(String checkNick);
	
	//�씠硫붿씪 以묐났泥댄겕
	int emailCheck(String checkEmail);
	
	//�쉶�썝媛��엯
	int joinMember(Member m);
	
	//�쉶�썝媛��엯�떆 �룷�씤�듃 insert
	int joinPoint(Member m);

	//濡쒓렇�씤
	Member loginMember(Member m);

   //濡쒓렇�씤�떆 異쒖꽍 �룷�씤�듃 select
   int loginPointChk(Member m);

   //濡쒓렇�씤 �룷�씤�듃 insert
   int loginPointInsert(Member m);
   
   // 濡쒓렇�씤 李얘린
   Member memberSerchId(Member m);
   
   //�쉶�썝�깉�눜
   int deleteMember(String userId);
  
   //湲곗〈 鍮꾨�踰덊샇 �솗�씤
   int memberPwdChk(Member m);
   
   
   //�젙蹂댁닔�젙
   int updateMember(Member m);

   //鍮꾨�踰덊샇 李얘린(�쉶�썝�씠 �엯�젰�븳 媛믪씠 �씪移섑븳吏� �솗�씤)
   Member memberSearchPwd(Member m);
   
   //�엫�떆踰덊샇 硫붿씪 蹂대궡湲�
   void sendMailInsert(Member m);
   
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
	ArrayList<TodoList> selectTodoList(TodoList td);
	ArrayList<Calendar> selectTodoCalendarList(Calendar cl);
	
	// 완료 카운트
	int completeTodo(int todoNo);
	
	//todoList 추가
	int insertTodoList(TodoList td);
	
	//todoList 체크
	int checkTodoList(int todoNo);
	
	//todoList uncheck
	int uncheckTodoList(int todoNo);
	
	// todoList 삭제
	int deleteTodoList(int todoNo);
	
	// todoList 수정
	int updateTodoList(TodoList td);
	
	
	
	
	
	
	// 이유진 -----------------------------------------------------------------------------------
	
	// 토탈포인트(사용가능한 포인트)
	int selectTotalPoint(String memberId);
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	ArrayList<Point> selectPointList3(String memberId);
	
	// 포인트 내역 조회 + 페이징처리
	// 사용자의 포인트 내역 수 가져오기
	int myPointListCount(String memberId);
	// 사용자의 포인트 리스트 조회
	ArrayList<Point> myPointList(PageInfo pi, String memberId);
	
	// 오늘 얻은 포인트 가져오기(적립내용만)
	int todayPoint(String memberId);
	
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	ArrayList<Alarm> selectAlarmList5(String memberId);
	
	
	// 사용자가 작성한 게시글 리스트 조회 + 페이징 처리
	// 사용자가 작성한 게시글 수 가져오기
	int myBoardListCount(Board b);
	// 사용자가 작성한 게시글 리스트 조회
	ArrayList<Board> myBoardList(PageInfo pi, Board b);
	
	
	// 사용자가 작성한 댓글 리스트 조회 + 페이징 처리
	// 사용자가 작성한 댓글 수 가져오기
	int myReplyListCount(String memberId);
	// 사용자가 작성한 댓글 리스트 조회
	ArrayList<Reply> myReplyList(PageInfo pi, String memberId);
	

	
	// 문의글 리스트 조회 + 페이징처리
	// 사용자가 작성한 문의글 수 가져오기
	//int selectQnaListCount(String memberId);
	int selectQnaListCount(QNA qna);
	// 사용자가 작성한 문의글 리스트 조회
	//ArrayList<QNA> selectQnaList(PageInfo pi, String memberId);
	ArrayList<QNA> selectQnaList(PageInfo pi, QNA qna);
	
	// 문의글 작성하기
	int insertQna(QNA qna);
	
	// 작성한 문의글 번호 가져오기
	QNA selectQnaNo(String memberId);
	
	// 문의글 상세보기
	QNA qnaDetailView(int qno);
	
	// 문의글 삭제하기
	int qnaDelete(int qno);
	
	  
}
