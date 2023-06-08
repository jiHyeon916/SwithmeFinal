package com.kh.swithme.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.swithme.member.model.service.MemberService;

@Controller
public class MemberControllerL {
	
	
	
	@Autowired
	private MemberService memberService;
	
	//회원가입 작성 폼으로 이동
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	//로그인 폼으로 이동
	@RequestMapping("loginForm.me")
	public String loginMemberForm() {
		return "member/loginForm";
	}

	
	//아이디 찾기 폼으로 이동
	@RequestMapping("searchIdForm.me")
	public String searchIdForm() {
		return "member/searchIdForm";
	}
	
	//비밀번호 찾기 폼으로 이동
	@RequestMapping("searchPwdForm.me")
	public String searchPwdForm() {
		return "member/searchPwdForm";
	}
	
	//마이페이지 알람으로 가기
	@RequestMapping("alarm.me")
	public String myPageAlarm() {
		return "member/myPageAlarm";
	}
	//메일 작성폼으로 이동
	@RequestMapping("mail.me")
	public String myPageMail() {
		return "member/myPageMail";
	}
	//마이페이지 프로필로 이동
	@RequestMapping("profil.me")
	public String profilMember() {
		return "member/myPageProfil";
	}
	
	
	
	
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		
		return memberService.idCheck(checkId) > 0 ? "N" : "Y";

	}
	
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheck(String checkNick) {
		return memberService.nickCheck(checkNick) > 0 ? "N" : "Y";
	}
	
	
	
	
	
	
	
	
}
