package com.kh.swithme.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.BandBookMark;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.MemberItem;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;
import com.kh.swithme.member.model.vo.TodoList;

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
	//로그인 시 출석 포인트 조회
	public int loginPointChk(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginPointChk",m);
	}
	//로그인 시 포인트 지급
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
	//알람 조회
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, String memberId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAlarmList", memberId);
	}

	//알람 읽음 여부 - 게시판
	public int readAlarm(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {

		return sqlSession.update("memberMapper.readAlarm", map);
	}
	
	//알림 읽음 여부 - 밴드
	public int readAlarmB(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("memberMapper.readAlarmB",map);
	};
	



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

	public ArrayList<TodoList> selectTodoList(SqlSessionTemplate sqlSession, TodoList td){
		return (ArrayList)sqlSession.selectList("memberMapper.selectTodoList", td);
	}
	
	public ArrayList<TodoList> todoAchievementRateList(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.todoAchievementRateList", memberId);
	}
	
	public int insertTodoList(SqlSessionTemplate sqlSession, TodoList td) {
		return sqlSession.insert("memberMapper.insertTodoList", td);
	}
	
	public int deleteTask(SqlSessionTemplate sqlSession, TodoList td) {
		return sqlSession.delete("memberMapper.deleteTask", td);
	}

	public int checkTodoList(SqlSessionTemplate sqlSession, int todoNo) {
		return sqlSession.update("memberMapper.checkTodoList", todoNo);
	}
	
	public int uncheckTodoList(SqlSessionTemplate sqlSession, int todoNo) {
		return sqlSession.update("memberMapper.uncheckTodoList", todoNo);
	}
	
	public ArrayList<Band> allStudyBandList(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.allStudyBandList", memberId);
	}
	
	public ArrayList<Band> favoriteStudyBand(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.favoriteStudyBand", memberId);
	}
	
	public int insertSbandBookmark(SqlSessionTemplate sqlSession, BandBookMark bm) {
		return sqlSession.insert("memberMapper.insertSbandBookmark", bm);
	}
	
	public int deleteSbandBookmark(SqlSessionTemplate sqlSession, BandBookMark bm) {
		return sqlSession.insert("memberMapper.deleteSbandBookmark", bm);
	}
	
	public int selectBookMarkListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectBookMarkListCount", memberId);
	}
	
	public ArrayList<Board> selectBoardBookMarkList(SqlSessionTemplate sqlSession, String memberId, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardBookMarkList", memberId, rowBounds);
	}
	
	public int deleteBoardBookMark(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("memberMapper.deleteBoardBookMark", boardNo);
	}


	
	
	// 이유진 -----------------------------------------------------------------------------------

	// 토탈포인트(사용가능한 포인트)
	public int selectTotalPoint(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectTotalPoint", memberId);
	}
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	public ArrayList<Point> selectPointList3(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.selectPointList3", memberId);
	}
	
	// 포인트 내역 수 가져오기
	public int myPointListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.myPointListCount", memberId);
	}
	
	// 사용자의 포인트 리스트 조회
	public ArrayList<Point> myPointList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPointList", memberId, rowBounds);
	}
	
	// 오늘 얻은 포인트 가져오기(적립내용만)
	public int todayPoint(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.todayPoint", memberId);
	}
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	public ArrayList<Alarm> selectAlarmList5(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAlarmList5", memberId);
	}
	
	// 사용자가 작성한 게시글 수 가져오기
	public int myBoardListCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("memberMapper.myBoardListCount", b);
	}
	
	// 사용자가 작성한 게시글 리스트 조회
	public ArrayList<Board> myBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Board b){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myBoardList", b, rowBounds);
	};

	// 사용자가 작성한 댓글 수 가져오기	
	public int myReplyListCount(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("memberMapper.myReplyListCount", r);
	}
	
	// 사용자가 작성한 댓글 리스트 조회
	public ArrayList<Reply> myReplyList(SqlSessionTemplate sqlSession, PageInfo pi, Reply r){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myReplyList", r, rowBounds);
	};

	
	// 문의글 수 가져오기
	public int selectQnaListCount(SqlSessionTemplate sqlSession, QNA qna) {
		return sqlSession.selectOne("memberMapper.selectQnaListCount", qna);
	}
	
	// 문의글 목록 가져오기
	public ArrayList<QNA> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, QNA qna){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQnaList", qna, rowBounds);
	}
	
	// 문의글 작성하기
	public int insertQna(SqlSessionTemplate sqlSession, QNA qna) {
		return sqlSession.insert("memberMapper.insertQna", qna);
	}
	
	// 작성한 문의글 번호 가져오기
	public QNA selectQnaNo(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectQnaNo", memberId);
	}
	
	// 문의글 상세보기
	public QNA qnaDetailView(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("memberMapper.qnaDetailView", qno);
	}
	
	// 문의글 삭제하기
	public int qnaDelete(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.delete("memberMapper.qnaDelete", qno);
	}

	// 회원가입시 기본 캐릭터 지급
	public int defaultCharacter(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.defaultCharacter", m);
	}
	
	// 회원가입시 기본 배경 지급
	public int defaultBackground(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.defaultBackground", m);
	}
	
	// 보유 아이템 리스트 카운트
	public int myItemListCount(SqlSessionTemplate sqlSession, MemberItem mItem) {
		return sqlSession.selectOne("memberMapper.myItemListCount", mItem);
	};
	
	// 보유 아이템 리스트
	public ArrayList<Item> myItemList(SqlSessionTemplate sqlSession, PageInfo pi, MemberItem mItem){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myItemList", mItem, rowBounds);
	}

	// 보유 아이템 삭제
	public int deleteMyItem(SqlSessionTemplate sqlSession, MemberItem mitem) {
		return sqlSession.delete("memberMapper.deleteMyItem", mitem);
	};
	
	// 착용한 아이템 가져오기
	public ArrayList<Item> myCharacter(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.myCharacter", memberId);
	}

	// 착용상태 변경
	public int wearStatusUpdate(SqlSessionTemplate sqlSession, MemberItem mItem) {
		return sqlSession.update("memberMapper.wearStatusUpdate", mItem);
	}

}
