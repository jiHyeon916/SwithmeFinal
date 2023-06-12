package com.kh.swithme.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;


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
   
   
   //회원 디테일 조회정보
   public ArrayList<Board> memberDetailInfo(String memberId);
}