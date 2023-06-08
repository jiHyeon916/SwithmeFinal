package com.kh.swithme.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;

@Repository
public class MemberDao {

	
	//지현
	
	//아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	//닉네임 중복체크
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	// 이메일 중복체크
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck",checkEmail);
	}
	// 회원가입
   public int joinMember(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.insert("memberMapper.joinMember", m);
   }
   //회원가입 시 포인트
   public int joinPoint(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.insert("memberMapper.joinPoint", m);
   }
   //로그인
   public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.loginMember",m);
   }
   //로그인 시 출석 포인트 체크
   public int loginPointChk(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.loginPointChk",m);
   }
   //로그인 시 포인트
   public int loginPointInsert(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.insert("memberMapper.loginPointInsert", m);
   }
   //아이디 찾기
   public Member memberSerchId(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.memberSerchId",m); 
   }
   //회원탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}
	//기존 비밀번호 확인
	public int memberPwdChk(SqlSessionTemplate sqlSession, Member m ) {
		return sqlSession.selectOne("memberMapper.memberPwdChk", m);
	}
	
	//정보수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	//비밀번호 찾기(회원이 입력한 값이 일치한지 확인)
	public Member memberSearchPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.memberSearchPwd",m);	
	}
	//임시비밀번호 메일전송(DB에저장)
	public void sendMailInsert(SqlSessionTemplate sqlSession, Member m) {
		sqlSession.update("memberMapper.sendMailInsert", m);
		
	}

	
	//----------------------희재
		public ArrayList<Calendar> selectMyCalendarlList(SqlSessionTemplate sqlSession, String memberId){
			return (ArrayList)sqlSession.selectList("memberMapper.selectMyCalendarlList", memberId);
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
