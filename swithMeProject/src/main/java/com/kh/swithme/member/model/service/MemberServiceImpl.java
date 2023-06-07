package com.kh.swithme.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.member.model.dao.MemberDao;
import com.kh.swithme.member.model.vo.Mail;
import com.kh.swithme.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//아이디 중복체크
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	//닉네임 중복체크
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}

	//이메일 중복체크
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession,checkEmail);
	}
	
	//회원가입
	@Override
	public int joinMember(Member m) {
		return memberDao.joinMember(sqlSession, m);
	
	}

	//회원가입시 포인트 insert
	@Override
	public int joinPoint(Member m) {
		return memberDao.joinPoint(sqlSession, m);
	}
	
	 /**
	    *로그인 select
	    */
	   @Override
	   public Member loginMember(Member m) {
	      return memberDao.loginMember(sqlSession, m);
	   }
	   
	   
	   /**
	    *로그인 시 pointSelect   
	    */
	   @Override
	   public int loginPointChk(Member m) {
	      return memberDao.loginPointChk(sqlSession,m);
	   }
	   
	   /**
	    *로그인 시 포인트 지급
	    */
	   @Override
	   public int loginPointInsert(Member m) {
	      return memberDao.loginPointInsert(sqlSession, m);
	   }
	   
	   /**
	    *아이디 찾기
	    */
	   @Override
	   public Member memberSerchId(Member m) {
	      return memberDao.memberSerchId(sqlSession, m);
	   }

		/**
		 *회원 탈퇴
		 */
		@Override
		public int deleteMember(String userId) {
			return memberDao.deleteMember(sqlSession, userId);
		}
	
		/**
		 * 기존 비밀번호 확인
		 */
		@Override
		public int memberPwdChk(Member m) {
			return memberDao.memberPwdChk(sqlSession, m);
		}
		
		/**
		 * 정보수정
		 */
		@Override
		public int updateMember(Member m) {
			return memberDao.updateMember(sqlSession,m);
		}

		/**
		 *비밀번호 찾기(회원이 입력한 값이 일치한지 확인)
		 */
		@Override
		public Member memberSearchPwd(Member m) {
			return memberDao.memberSearchPwd(sqlSession, m);
		}

		/**
		 *
		 */
		@Override
		public void sendMailInsert(Member m) {
			memberDao.sendMailInsert(sqlSession, m);
		}

	
	   
	   

	
	
	
	
	

}
