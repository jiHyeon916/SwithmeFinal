package com.kh.swithme.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.admin.model.dao.AdminDao;
import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.QNA;

@Service
public class AdminServiceImpl implements AdminService {

   @Autowired
   private AdminDao adminDao;
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   
   
   
//지현
   
   //회원들의 count조회(페이징)
   @Override
   public int selectMemberCount() {
      return adminDao.selectMemberCount(sqlSession);
   }
   
   //회원들 모두 조회(페이징)
   @Override
   public ArrayList<Member> adminMemberList(PageInfo pi) {
      return adminDao.adminMemberList(sqlSession, pi);
   }
   //검색한 키워드가 포함된 결과 count(페이징)
   @Override
   public int selectMemberSearchCount(HashMap<String, String> map) {
      return adminDao.selectMemberSearchCount(sqlSession, map);
   }
   //검색 결과 페이징
   @Override
   public ArrayList<Member> selectMemberSearchList(HashMap<String, String> map, PageInfo pi) {
      return adminDao.selectMemberSearchList(sqlSession, map,pi);
   }
   //회원 상태 조회
   @Override
   public Member memberStatus(String memberId) {
      return adminDao.memberStatus(sqlSession,memberId);
   }
   //회원정지해제
   @Override
   public int memberStopFree(String memberId) {
      return adminDao.memberStopFree(sqlSession,memberId);
   }

   // 회원 정지
   @Override
   public int memberStop(String memberId) {
      return adminDao.memberStop(sqlSession,memberId);
   }

   //회원 디테일 조회정보(select) band
   @Override
   public ArrayList<Board> memberDetailBoard(String memberId) {
      return (ArrayList)adminDao.memberDetailBoard(sqlSession, memberId);
   }
   //회원 디테일 조회정보(select) sband
   @Override
   public ArrayList<Band> memberDetailBand(String memberId) {
      return (ArrayList)adminDao.memberDetailBand(sqlSession, memberId);
      
   }
  //회원 정보 조회
  @Override
  public Member memberInfo(String memberId) {
     return adminDao.memberInfo(sqlSession, memberId);
      }
  
  //회원 board 글 삭제
  @Override
  public int deleteBoardDetail(int boardNo) {
	  return adminDao.deleteBoardDetail(sqlSession,boardNo);
  }
  //회원 band 글 삭제 
  @Override
  public int deleteBandDetail(int boardNo) {
	  return adminDao.deleteBandDetail(sqlSession,boardNo);
  }
  
   
      
      
	
	// 이유진 ----------------------------------------
	
	// 문의글 리스트 조회 + 페이징처리
	// 모든 문의글 수 가져오기
	@Override
	public int selectQnaListCount(String qnaStatus) {
		return adminDao.selectQnaListCount(sqlSession, qnaStatus);
	}

	// 모든 문의글 리스트 조회
	@Override
	public ArrayList<QNA> selectQnaList(PageInfo pi, String qnaStatus) {
		return adminDao.selectQnaList(sqlSession, pi, qnaStatus);
	}
	
	// 문의글 답변 INSERT
	@Override
	public int insertQnaReply(QNAReply qr) {
		return adminDao.insertQnaReply(sqlSession, qr);
	};
	
	// 문의글 답변 목록 출력
	@Override
	public ArrayList<QNAReply> selectQnaReply(int qnaNo) {
		return adminDao.selectQnaReply(sqlSession, qnaNo);
	};
	
	// 문의글 답변여부 상태변화
	@Override
	public int qnaStatusUpdate(int qnaNo) {
		return adminDao.qnaStatusUpdate(sqlSession, qnaNo);
	};
	
	
	// 문의글 답변 삭제
	@Override
	public int qnaReplyDelete(int qnaNo) {
		return adminDao.qnaReplyDelete(sqlSession, qnaNo);
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	// 희재 -----------------------------------------------
	
	// 스터디룸 
	// 스터디룸 리스트 전체 count
	@Override
	public int adminStudyRoomListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디룸 전체 리스트 조회
	@Override
	public ArrayList<StudyRoom> selectAllStudyRoomList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	// 스터디룸 추가
	@Override
	public int insertStudyRoom(StudyRoom sr) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디룸 선택 삭제
	@Override
	public int deleteCheckStudyRoom(int studyRoomNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디룸 상세보기 삭제
	@Override
	public int deleteStudyRoom(int studyRoomNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디룸 정보 수정
	@Override
	public int updateStudyRoom(StudyRoom sr) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디밴드 관리
	// 스터디 목록 조회
	@Override
	public ArrayList<Band> selectSBandList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	// 스터디 삭제
	@Override
	public int deleteStudyBand(int bandNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디 검색 결과 count
	@Override
	public int selectSearchSBandListCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 스터디 검색 결과
	@Override
	public ArrayList<Band> selectSearchSBandList(HashMap<String, String> map, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	

	


   
   
   
}