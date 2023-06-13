package com.kh.swithme.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.QNA;

@Repository
public class AdminDao {

		//지현
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

	   //회원 상태 조회
	   public Member  memberStatus(SqlSessionTemplate sqlSession, String memberId) {
	      return sqlSession.selectOne("adminMapper.memberStatus",memberId);
	   }
	   //회원 정지 해제
	   public int memberStopFree(SqlSessionTemplate sqlSession, String memberId) {
	      return sqlSession.update("adminMapper.memberStopFree",memberId);
	            
	   }
	   //회원 정지
	   public int memberStop(SqlSessionTemplate sqlSession,String memberId) {
	      return sqlSession.update("adminMapper.memberStop", memberId);
	   }

	      //회원 디테일 조회정보(select) band
	   public ArrayList<Board> memberDetailBoard(SqlSessionTemplate sqlSession, String memberId) {
	      return (ArrayList)sqlSession.selectList("adminMapper.memberDetailBoard", memberId);
	   }
	   //회원 디테일 조회정보(select) Sband
	   public ArrayList<Band> memberDetailBand(SqlSessionTemplate sqlSession, String memberId) {
	      return (ArrayList)sqlSession.selectList("adminMapper.memberDetailBand", memberId);
	   }
	   
	   //회원 정보 조회
	   public Member memberInfo(SqlSessionTemplate sqlSession, String memberId) {
		   return sqlSession.selectOne("adminMapper.memberInfo", memberId);
	
	   }
	   
	   //회원 baord 글 삭제
	   public int deleteBoardDetail(SqlSessionTemplate sqlSession, int boardNo) {
		   return sqlSession.update("adminMapper.deleteBoardDetail", boardNo);
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	// 이유진 ----------------------------------------
	
	// 문의글 리스트 조회 + 페이징처리
	// 모든 문의글 수 가져오기
	public int selectQnaListCount(SqlSessionTemplate sqlSession, String qnaStatus) {
		return sqlSession.selectOne("adminMapper.selectQnaListCount", qnaStatus);
	};
	
	// 모든 문의글 리스트 조회
	public ArrayList<QNA> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String qnaStatus){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectQnaList", qnaStatus, rowBounds);
	};
	
	// 문의글 답변 INSERT
	public int insertQnaReply(SqlSessionTemplate sqlSession, QNAReply qr) {
		return sqlSession.insert("adminMapper.insertQnaReply", qr);
	};
	
	// 문의글 답변 목록 출력
	public ArrayList<QNAReply> selectQnaReply(SqlSessionTemplate sqlSession, int qnaNo){
		return (ArrayList)sqlSession.selectList("adminMapper.selectQnaReply", qnaNo);
	};
	
	// 문의글 답변여부 상태변화
	public int qnaStatusUpdate(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("adminMapper.qnaStatusUpdate", qnaNo);
	};
	
	// 문의글 답변 삭제
	public int qnaReplyDelete(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.delete("adminMapper.qnaReplyDelete", qnaNo);
	}


	}


