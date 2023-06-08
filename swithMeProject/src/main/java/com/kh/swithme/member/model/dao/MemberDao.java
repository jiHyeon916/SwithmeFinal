package com.kh.swithme.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.member.model.vo.Calendar;

@Repository
public class MemberDao {

	
	//지현
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	
	
	//----------------------희재
	public ArrayList<Calendar> selectMyCalendarlList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyCalendarlList");
	}
	
	public int addSchedule(SqlSessionTemplate sqlSession, Calendar cl) {
		return sqlSession.insert("memberMapper.addSchedule", cl);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, Calendar cl) {
		return sqlSession.delete("memberMapper.deleteSchedule", cl);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlSession, Calendar cl) {
		return sqlSession.update("memberMapper.updateScehdule", cl);
	}
	

}
