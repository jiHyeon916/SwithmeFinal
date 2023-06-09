package com.kh.swithme.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;

@Repository
public class AdminDao {

	//회원들 전체 수 
	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberCount");
	}
	
	//회원들 조회(페이징)
	public ArrayList<Member> adminMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminMemberList", null, rowBounds );
	}
	
	//검색한 키워드가 포함된 결과 count(페이징)
	public int selectMemberSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectMemberSearchCount", map);
	}
	//검색 결과 페이징
	public ArrayList<Member> selectMemberSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberSearchList", map, rowBounds);
	}

	public int memberStop(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("adminMapper.memberStop",memberId);
				
	}


}
