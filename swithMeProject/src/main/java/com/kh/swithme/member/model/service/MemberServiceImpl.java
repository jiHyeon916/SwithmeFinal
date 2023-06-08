package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.member.model.dao.MemberDao;
import com.kh.swithme.member.model.vo.Calendar;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}

	@Override
	public ArrayList<Calendar> selectMyCalendarlList() {
		return memberDao.selectMyCalendarlList(sqlSession);
	}

	@Override
	public int addSchedule(Calendar cl) {
		return memberDao.addSchedule(sqlSession, cl);
	}

	@Override
	public int deleteSchedule(Calendar cl) {
		return memberDao.deleteSchedule(sqlSession, cl);
	}

	@Override
	public int updateSchedule(Calendar cl) {
		return memberDao.updateSchedule(sqlSession, cl);
	}
	
	
	

}
