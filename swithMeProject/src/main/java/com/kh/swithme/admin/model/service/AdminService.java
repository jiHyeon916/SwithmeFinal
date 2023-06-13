package com.kh.swithme.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.band.model.vo.Sband;
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
	   
	   
	   //회원 디테일 조회정보(Band)
	   public ArrayList<Band> memberDetailBand(String memberId);
	   
	   //회원 디테일 조회정보(Sband)
	   public ArrayList<Sband> memberDetailSband(String memberId);
	   
	
   
   
   
   
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
   
   
}