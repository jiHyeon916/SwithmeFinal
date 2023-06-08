package com.kh.swithme.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.admin.model.dao.AdminDao;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원들의 count조회(페이징처리)
	@Override
	public int selectMemberCount() {
		return adminDao.selectMemberCount(sqlSession);
	}
	
	//회원들 모두 조회(페이징)
	@Override
	public ArrayList<Member> adminMemberList(PageInfo pi) {
		return adminDao.adminMemberList(sqlSession, pi);
	}
	
	
	
	
}
