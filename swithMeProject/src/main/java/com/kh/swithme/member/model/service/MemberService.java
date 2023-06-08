package com.kh.swithme.member.model.service;

import com.kh.swithme.member.model.vo.Mail;
import com.kh.swithme.member.model.vo.Member;

public interface MemberService {
	
	
	//아이디 중복 체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nickCheck(String checkNick);
	
	//이메일 중복체크
	int emailCheck(String checkEmail);
	
	//회원가입
	int joinMember(Member m);
	
	//회원가입시 포인트 insert
	int joinPoint(Member m);

	//로그인
	Member loginMember(Member m);

   //로그인시 출석 포인트 select
   int loginPointChk(Member m);

   //로그인 포인트 insert
   int loginPointInsert(Member m);
   
   // 로그인 찾기
   Member memberSerchId(Member m);
   
   //회원탈퇴
   int deleteMember(String userId);
  
   //기존 비밀번호 확인
   int memberPwdChk(Member m);
   
   
   //정보수정
   int updateMember(Member m);

   //비밀번호 찾기(회원이 입력한 값이 일치한지 확인)
   Member memberSearchPwd(Member m);
   
   //임시번호 메일 보내기
   void sendMailInsert(Member m);
	
	  
}
