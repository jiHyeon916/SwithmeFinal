package com.kh.swithme.admin.model.service;

import java.util.ArrayList;

import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;


public interface AdminService {
	
	//회원들의 count조회(페이징처리_
	public int selectMemberCount();

	//회원관리 회원들 조회
	public ArrayList<Member> adminMemberList(PageInfo pi);
	

}
