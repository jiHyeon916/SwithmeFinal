package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
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
	
	  
}
