package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.dao.MemberDao;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.BandBookMark;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;
import com.kh.swithme.member.model.vo.TodoList;

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

	
	   
	   //-----------------------------희재
		@Override
		public ArrayList<Calendar> selectMyCalendarlList(String memberId) {
			return memberDao.selectMyCalendarlList(sqlSession, memberId);
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
		
		@Override
		public ArrayList<TodoList> selectTodoList(TodoList td) {
			return memberDao.selectTodoList(sqlSession, td);
		}
		
		@Override
		public ArrayList<TodoList> todoAchievementRateList(String memberId) {
			return memberDao.todoAchievementRateList(sqlSession, memberId);
		}

		@Override
		public int completeTodo(int todoNo) {
			return 0;
		}

		@Override
		public int insertTodoList(TodoList td) {
			return memberDao.insertTodoList(sqlSession, td);
		}
		
		@Override
		public int checkTodoList(int todoNo) {
			return memberDao.checkTodoList(sqlSession, todoNo);
		}
		
		@Override
		public int uncheckTodoList(int todoNo) {
			return memberDao.uncheckTodoList(sqlSession, todoNo);
		}

		@Override
		public int deleteTask(TodoList td) {
			return memberDao.deleteTask(sqlSession, td);
		}

		@Override
		public int updateTodoList(TodoList td) {
			return 0;
		}

		@Override
		public ArrayList<Band> allStudyBandList(String memberId) {
			return memberDao.allStudyBandList(sqlSession, memberId);
		}

		@Override
		public ArrayList<Band> favoriteStudyBand(String memberId) {
			return memberDao.favoriteStudyBand(sqlSession, memberId);
		}

		@Override
		public int insertSbandBookmark(BandBookMark bm) {
			return memberDao.insertSbandBookmark(sqlSession, bm);
		}

		@Override
		public int deleteSbandBookmark(BandBookMark bm) {
			return memberDao.deleteSbandBookmark(sqlSession, bm);
		}

		@Override
		public int selectBookMarkListCount(String memberId) {
			return memberDao.selectBookMarkListCount(sqlSession, memberId);
		}

		@Override
		public ArrayList<Board> selectBoardBookMarkList(String memberId, PageInfo pi) {
			return memberDao.selectBoardBookMarkList(sqlSession, memberId, pi);
		}

		@Override
		public int deleteBoardBookMark(int boardNo) {
			return memberDao.deleteBoardBookMark(sqlSession, boardNo);
		}

		

	
	// 이유진 -----------------------------------------------------------------------------------

	// 토탈포인트(사용가능한 포인트)
	@Override
	public int selectTotalPoint(String memberId) {
		return memberDao.selectTotalPoint(sqlSession, memberId);
	}

	// 마이페이지 메인 - 포인트 내역(최신 3개)
	@Override
	public ArrayList<Point> selectPointList3(String memberId) {
		return memberDao.selectPointList3(sqlSession, memberId);
	}

	// 포인트 내역 조회 + 페이징처리
	// 사용자의 포인트 내역 수 가져오기
	@Override
	public int myPointListCount(String memberId) {
		return memberDao.myPointListCount(sqlSession, memberId);
	};
	
	// 사용자의 포인트 리스트 조회
	@Override
	public ArrayList<Point> myPointList(PageInfo pi, String memberId){
		return memberDao.myPointList(sqlSession, pi, memberId);
	};
	
	// 오늘 얻은 포인트 가져오기(적립내용만)
	@Override
	public int todayPoint(String memberId) {
		return memberDao.todayPoint(sqlSession, memberId);
	};
	
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	@Override
	public ArrayList<Alarm> selectAlarmList5(String memberId) {
		return memberDao.selectAlarmList5(sqlSession, memberId);
	}
	
	// 사용자가 작성한 게시글 리스트 조회 + 페이징 처리
	// 사용자가 작성한 게시글 수 가져오기
	@Override
	public int myBoardListCount(Board b) {
		return memberDao.myBoardListCount(sqlSession, b);
	};

	// 사용자가 작성한 게시글 리스트 조회
	@Override
	public ArrayList<Board> myBoardList(PageInfo pi, Board b){
		return memberDao.myBoardList(sqlSession, pi, b);
	};
	
	
	// 사용자가 작성한 댓글 리스트 조회 + 페이징 처리
	// 사용자가 작성한 댓글 수 가져오기	
	@Override
	public int myReplyListCount(Reply r) {
		return memberDao.myReplyListCount(sqlSession, r);
	};
	
	
	// 사용자가 작성한 댓글 리스트 조회
	@Override
	public ArrayList<Reply> myReplyList(PageInfo pi, Reply r){
		return memberDao.myReplyList(sqlSession, pi, r);
	};
	
	// 문의글 리스트 조회 + 페이징처리
	// 사용자가 작성한 게시글 수 가져오기
	@Override
	public int selectQnaListCount(QNA qna) {
		return memberDao.selectQnaListCount(sqlSession, qna);
	}

	// 사용자가 작성한 문의글 리스트 조회
	@Override
	public ArrayList<QNA> selectQnaList(PageInfo pi, QNA qna) {
		return memberDao.selectQnaList(sqlSession, pi, qna);
	}
	
	// 문의글 작성하기
	@Override
	public int insertQna(QNA qna) {
		return memberDao.insertQna(sqlSession, qna);
	};
	
	// 작성한 문의글 번호 가져오기
	@Override
	public QNA selectQnaNo(String memberId) {
		return memberDao.selectQnaNo(sqlSession, memberId);
	};
	
	// 문의글 상세보기
	@Override
	public QNA qnaDetailView(int qno) {
		return memberDao.qnaDetailView(sqlSession, qno);
	};
	
	// 문의글 삭제하기
	@Override
	public int qnaDelete(int qno) {
		return memberDao.qnaDelete(sqlSession, qno);
	};
	

}
