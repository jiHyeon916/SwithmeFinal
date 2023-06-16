package com.kh.swithme.band.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.band.model.vo.BandBoard;
import com.kh.swithme.band.model.vo.BandMember;
import com.kh.swithme.band.model.vo.BandReply;
import com.kh.swithme.band.model.vo.BandReport;

public interface BandService {
	
	// test
	ArrayList<Band> selectTestBand(Band b);
	// test 끝
	// ------------------- 밴드 메인 -------------------
	// int selectListCount(); 페이징 처리가 필요하면 해야함!
	
	// 밴드 게시글 리스트 조회
	ArrayList<BandBoard> selectBandList(int sbNo);
	
	// 밴드 사이드바 
	Band ajaxSelectBandSideBar(int sno);
	
	//밴드 토탈 멤버확인
	BandMember selectTotalMember(BandMember bm);
	
	// 밴드 글 작성
	int insertBandBoard(BandBoard bb);
	
	// 밴드 글 상세보기
	// 밴드 글 조회수 증가
	int increaseCount(int sbBoardNo);
	// 밴드 글 상세조회
	BandBoard selectBandBoard(int sbBoardNo);
	// 밴드 글 수정하기
	int updateBandBoard(BandBoard bb);
	// 밴드 글 삭제하기
	int deleteBandBoard(int sbBoardNo);
	
	// 밴드 댓글 리스트 조회(AJAX)
	ArrayList<BandReply> ajaxSelectBandReplyList(int sbBoardNo);
	// 밴드 댓글 작성하기 (AJAX)
	int ajaxInsertBandReply(BandReply br);
	// 밴드 댓글 수정하기 뷰(AJAX)
	BandReply replyModifyView(int sbReplyNo);
	// 밴드 댓글 수정하기 (AJAX)
	int updateBandReply(BandReply br);
	// 밴드 댓글 삭제하기 (AJAX)
	int deleteBandReply(int sbReplyNo);
	// 밴드 댓글 갯수 (AJAX) int selectBandReplyCount(int sbNo);
	
	// ------------------- 밴드 글 검색 -------------------
	ArrayList<BandBoard> selectBandSearchList(BandBoard bb);
	
	
	// ------------------- 밴드 가입 -------------------
	int insertBandMember(BandMember bm);
	int enrollBandMember(int sbNo);
	int banishComfirm(BandMember bm);
	
	// ------------------- 밴드 정보 -------------------
	Band selectBandInfo(int sbNo);

	
	// ------------------- 밴드 신고 -------------------
	int insertReport(BandReport br);

	
	// ------------------- 밴드 공지 -------------------
	// 밴드 공지 리스트 조회 
	ArrayList<BandBoard> selectBandNoticeList(int sbNo);
	// 밴드 공지 상세보기
	// 밴드 공지 조회수 증가
	int increaseNoticeCount(int sbBoardNo);
	// 밴드 공지 상세조회
	BandBoard selectBandNoticeBoard(int sbBoardNo);

	// ------------------- 밴드 일정 -------------------
	// 잘 모르겠음! 추후 영역
	// 밴드 일정 등록하기 int insertBandCalendar(int sbCalendarNo);
	// 밴드 일정 불러오기 int selectBandCalendar(int sbCalendarNo);
	
	
	// ------------------- 밴드 멤버 -------------------
	// 밴드 멤버 리스트 조회
	ArrayList<BandMember> selectMemberList(int sbNo);
	// 밴드 멤버 강제탈퇴(방장)
	int updateBandMember(BandMember bm);
	
	
	// ------------------- 밴드 탈퇴 -------------------
	// (delete 밴드)
	int deleteBandMember(BandMember bm);
	int deleteBandMemberCount(int sbNo);
	
	
	// ------------------- 밴드 설정 -------------------
	// 밴드 소개 변경
	int updateBand(Band b);
	// 밴드 프로필 사진 변경
	int updateBandProfile(Band b);
	// 밴드 리더 위임-방장번호 넘겨주기
	int updateBandReader(Band b);

	// 밴드 리더 위임 리스트 보여주기
	ArrayList<BandMember> readerList(int sno);



	
}
