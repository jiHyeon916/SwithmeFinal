package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import com.kh.swithme.member.model.vo.Calendar;

public interface MemberService {
	
	
	//아이디 중복 체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nickCheck(String checkNick);
	
	
	//----------------------희재
	//calendar 조회
	ArrayList<Calendar> selectMyCalendarlList();
	
	// calendar - 일정 추가
	int addSchedule(Calendar cl);
	
	// calendar - 일정 삭제
	int deleteSchedule(Calendar cl);
	
	// calendar - 일정 수정
	int updateSchedule(Calendar cl);
}
