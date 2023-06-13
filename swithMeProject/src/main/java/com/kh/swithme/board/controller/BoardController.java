package com.kh.swithme.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.swithme.board.model.service.BoardServiceImpl;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.ReReply;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class BoardController {

	
	@Autowired
	private BoardServiceImpl boardService;
	
	
	
	// 혜린
	/**
	 * 자유게시판 게시글 수 조회 !!!이거 보드타입별로 따로 조회해야하는거 아님>.!?!?!?
	 * @return 자유게시판
	 */
	@ResponseBody
	@RequestMapping("freeCount.bo")
	public int freeCount() {
		return boardService.freeCount();
	}
	
	/**
	 * 게시판 리스트 불러오기
	 * @param currentPage
	 * @param boardType 게시판 분류 (1. 자유게시판 / 2. 질문게시판)
	 * @param model
	 * @return 
	 */
	@RequestMapping("freeBoardListView.bo")
	public String boardListView(@RequestParam(value="cPage", defaultValue="1") int currentPage,
								int boardType, Model model) {
		
		if(boardType == 1) {
			PageInfo pi = Pagination.getPageInfo(boardService.boardListCount(boardType), currentPage, 20, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", boardService.selectBoardList(boardType, pi));
			return "board/freeBoardListView";
		}else {
			PageInfo pi = Pagination.getPageInfo(boardService.boardListCount(boardType), currentPage, 20, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", boardService.selectBoardList(boardType, pi));
			return "board/infoBoardListView";
		}
	}
	/**
	 * 게시글 상세 보기 
	 * @param boardNo 조회할 게시글 번호
	 * @return 게시판 상세 페이지
	 */
	@RequestMapping("freeBoardDetail.bo")
	public String boardDetail(int boardNo, Model model) {
		
		if(boardService.boardCountUp(boardNo) > 0) {
			// 로그인 유저가 좋아요 한상태인지 아닌
			Board status = new Board();
			status.setLikeStatus(boardService.likeStatus(boardNo));
			status.setBookStatus(boardService.bookStatus(boardNo));
			
			Board b = boardService.boardDetail(boardNo);
			String tagList = b.getTagList();
			if(tagList != null) {
				String[] tag = tagList.split(",");
				model.addAttribute("tag", tag);
			}
			
			model.addAttribute("status", status);
			model.addAttribute("b", b);
			
			
			
			return "board/freeBoardDetail";
		}else {
			return "errorPage";
		}
	}
	/**
	 * 좋아요 상태 확인 (나중에 로그인 유저 확인해야함)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("likeStatus.ck")
	public String likeStatus(int boardNo, Model model) {
		
		Board status = new Board();
		int likeStatus = boardService.likeStatus(boardNo);
		
		return new Gson().toJson(likeStatus);
	}
	/**
	 * 좋아요 수 카운트 
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("likeCount.bo")
	public int likeCount(int boardNo) {
		
		return boardService.likeCount(boardNo);
	}
	/**
	 * 좋아요 하기
	 * @param boardNo
	 * @param likeStatus
	 * @return
	 */
	@ResponseBody
	@RequestMapping("like.bo")
	public String likeBoard(int boardNo) {
		
		int likeStatus = boardService.likeStatus(boardNo);
		
		if(likeStatus > 0) {
			return new Gson().toJson(boardService.removeLike(boardNo));
		}else {
			return new Gson().toJson(boardService.likeBoard(boardNo));
		}
	}
	/**
	 * 북마크 상태 확인 (나중에 로그인 유저 확인해야함)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("bookStatus.ck")
	public String bookStatus(int boardNo) {
		
		int bookStatus = boardService.bookStatus(boardNo);
		
		return new Gson().toJson(bookStatus);
	}
	/**
	 * 북마크 하기
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("book.bo")
	public String bookBoard(int boardNo) {
	
		int bookStatus = boardService.bookStatus(boardNo);
		if(bookStatus > 0) {
			return new Gson().toJson(boardService.removeBook(boardNo));
		}else {
			return new Gson().toJson(boardService.bookBoard(boardNo));
		}
	}
	/**
	 * 북마크 수 카운트 
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("bookCount.bo")
	public int bookCount(int boardNo) {
		return boardService.bookCount(boardNo);
	}
	/**
	 * 댓글 리스트 가져오기
	 * @param boardNo 댓글이 달린 게시글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="replyList.bo", produces="application/json; charset=UTF-8")
	public String replyList(int boardNo) {
		return new Gson().toJson(boardService.replyList(boardNo));
	}
	/**
	 * 대댓글 리스트 불러오기 
	 * @param replyNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="reReplyList.bo", produces="application/json; charset=UTF-8")
	public String reReplyList(int replyNo) {
		return new Gson().toJson(boardService.reReplyList(replyNo));
	}
	/**
	 * 댓글 작성하기 
	 * @param boardNo 댓글이 달릴 게시글 번호 
	 * @param rCon 작성한 댓글 내용 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public String insertReply(int boardNo, String rCon, String memberId) {
		
		Reply r = new Reply();
		
		r.setBoardNo(boardNo);
		r.setBoardReplyContent(rCon.replace(System.getProperty("line.separator"), "<br>"));
		r.setMemberId(memberId);
		
		return boardService.insertReply(r) > 0 ? "success" : "fail";
		
	}
	/**
	 * 댓글 수 카운트
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("replyCount.bo")
	public int replyCount(int boardNo) {
		return boardService.replyCount(boardNo);
	}
	
	/**
	 * 대댓글 작성
	 * @param replyNo
	 * @param reReplyCon
	 * @return
	 */
	@ResponseBody
	@RequestMapping("reReply.bo")
	public int reReplyBoard(int replyNo, String reReplyCon, String memberId) {
		ReReply rere = new ReReply();
		rere.setReplyNo(replyNo);
		rere.setReReplyContent(reReplyCon.replace(System.getProperty("line.separator"), "<br>"));
		rere.setMemberId(memberId);
		
		return boardService.reReplyBoard(rere);
		
		
	}
	
	
	/**
	 * 글 작성하기 페이지로 이동
	 * @param boardType 보드타입 (1. 자유게시판 / 2.정보게시판) 
	 * @param model 보드타입에 따라 담겨져 가는 값 (글 작성시 이용하는 폼은 동일하며 타입에 따라 카테고리만 다르게 보여줄 것)
	 * @return
	 */
	@RequestMapping("freeBoardWrite.bo")
	public String freeBoardWrite(int boardType, Model model, HttpSession session) {
		
		if((Member)session.getAttribute("loginMember") == null){
			session.setAttribute("alertMsg", "로그인 후 이용해주세요");
			return "member/loginForm";
		}else {
			if(boardType == 1) {
				model.addAttribute("Btype", "free");
			}else {
				model.addAttribute("Btype", "info");
			}
			return "board/freeBoardWrite";
		}
	}
	
	/**
	 * 글 작성
	 * @param summary 리스트에 보여질 게시글 요약
	 * @param title 게시글 제목 
	 * @param category 카테고리 
	 * @param memberId 작성자 
	 * @param bCon 글 내용  
	 * @param tagList 태그 리스트 
	 * @param Btype 보드 타입 (1.자유게시판 / 2.정보 게시판)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="test.bo")
	public String test(String summary, String title, String category, String memberId, String bCon, String tagList, String Btype) {
		
		Board b = new Board();
		b.setBoardType(Btype);
		b.setBoardContent(bCon);
		b.setBoardTitle(title);
		b.setCategory(category);
		b.setMemberId(memberId);
		
		if(summary.length() > 150) {
			b.setSummary(summary.substring(0, 150));
		}else {
			b.setSummary(summary);
		}
		
		
		// 1. 게시글 insert
		if(boardService.test(b) > 0) {
			// 게시글 insert 성공시 태그 유무 확인 후 insert
			if(tagList != null) {
				boardService.tagInsert(tagList);
			}
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
	
	/**
	 * 태그 검색 
	 * @param model key가 포함된 게시글 리스트
	 * @param bSearch 검색을 위해 데이터 가공 *key = 검색어 / boardType = 어느 게시판에서 검색했는지 / keyType 태그인지 검색인지 *
	 * @return
	 */
	@RequestMapping("tagSearch.bo")
	public String tagSearch(@RequestParam(value="cPage", defaultValue="1") int currentPage, String key, String boardType, String keyType, Model model) {
		
		Board bSearch = new Board();
		bSearch.setKey(key);
		bSearch.setKeyType(keyType);
		bSearch.setBoardType(boardType);
		
		PageInfo pi = Pagination.getPageInfo(boardService.tagCount(bSearch), currentPage, 20, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.tagSearch(pi, bSearch));
		model.addAttribute("key", key);
		model.addAttribute("keyType", keyType);
		
		String[] sInfo = {key, Integer.toString(boardService.tagCount(bSearch))};
		model.addAttribute("searchTotal", sInfo);
		
		if(boardType.equals("free")) {
			return "board/freeBoardListView";
		}else {
			return "board/infoBoardListView";
		}
		
	}

	
	/**
	 * 검색 후 카테고리 필터 기능 
	 * @param keyType 현재 전체게시판인지 태그 검색창인지 키워드검색창인지 구분값 
	 * @param keyValue 키워드 
	 * @param boardType free인지 info인지 구분값 
	 * @param category 보고싶은 카테고리 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="categorySearch.bo", produces="application/json; charset=UTF-8")
	public String categorySearch(@RequestParam(value="cPage", defaultValue="1") int currentPage,
								 String keyValue, String boardType, String category, String keyType) {
		
		Board b = new Board();
		b.setKey(keyValue);
		b.setBoardType(boardType);
		b.setCategory(category);
		b.setKeyType(keyType);
		
		
		PageInfo pi = Pagination.getPageInfo(boardService.searchCount(b), currentPage, 20, 10);
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", boardService.categorySearch(b, pi));
		jobj.put("pi", pi);
		
		return new Gson().toJson(jobj);
	}
	
	/**
	 * 글 정렬하기 
	 * @param keyValue
	 * @param boardType
	 * @param category
	 * @param keyType
	 * @param sort
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sort.bo", produces="application/json; charset=UTF-8")
	public String sortSearch(@RequestParam(value="cPage", defaultValue="1") int currentPage,
							String keyValue, String boardType, String category, String keyType, String sort) {
		
		Board b = new Board();
		b.setKey(keyValue);
		b.setBoardType(boardType);
		b.setCategory(category);
		b.setKeyType(keyType);
		b.setBoardContent(sort); // 선택한 정렬이 뭔지 임시로 값 담아서 전
		
		PageInfo pi = Pagination.getPageInfo(boardService.searchCount(b), currentPage, 20, 10);
		
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", boardService.sortSearch(b, pi));
		jobj.put("pi", pi);
		
		return new Gson().toJson(jobj);
		
	}
	
	/**
	 * 글 수정하기 페이지 이동 
	 * @param boardNo 수정 원하는 게시글 번호 
	 * @param model 기존 작성된 보드 정보 
	 * @return
	 */
	@RequestMapping(value="boardModifyView.bo")
	public String boardModifyView(int boardNo, Model model) {
		
		model.addAttribute("b", boardService.boardModifyView(boardNo));
		return "board/boardModify";
	}
	
	
	/**
	 * 게시글 수정하기 
	 * @param summary
	 * @param title
	 * @param category
	 * @param memberId
	 * @param bCon
	 * @param tagList
	 * @param Btype
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="boardModify.bo")
	public String boardModify(String boardNo, String summary, String title, String category, String bCon, String tagList) {
		
		Board b = new Board();
		b.setBoardNo(Integer.parseInt(boardNo));
		b.setBoardContent(bCon);
		b.setBoardTitle(title);
		b.setCategory(category);
		
		if(summary.length() > 150) {
			b.setSummary(summary.substring(0, 150));
		}else {
			b.setSummary(summary);
		}
		
		// 1. 게시글 update
		if(boardService.boardModify(b) > 0) {
			// 게시글 update 성공시 태그 유무 확인 후 update
			if(tagList != null) {
				Board tag = new Board();
				tag.setTagList(tagList);
				tag.setBoardNo(Integer.parseInt(boardNo));
				
				boardService.tagUpdate(tag);
				
			}
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 댓글 수정하기 (뷰)
	 * @param replyNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="replyModifyView.bo", produces="application/json; charset=UTF-8")
	public String replyModifyView(int replyNo) {
		return new Gson().toJson(boardService.replyModifyView(replyNo));
	}
	
	/**
	 * 댓글 수정 
	 * @param replyNo
	 * @param replyCon
	 * @return
	 */
	@ResponseBody
	@RequestMapping("replyModify.bo")
	public String replyModify(int replyNo, String replyCon) {
		Reply r = new Reply();
		r.setBoardReplyNo(replyNo);
		r.setBoardReplyContent(replyCon.replace(System.getProperty("line.separator"), "<br>"));
		
		return boardService.replyModify(r) > 0 ? "success" : "fail";
	}
	
	
	/**
	 * 스터디밴드 게시글 리스트 보기
	 * @return
	 */
	@RequestMapping("studyBand.bo")
	public String studyBandListView() {
		return "board/studyBandBoardListView";
	}
	
	
	/**
	 * 스터디 모집하기 글 작성 화면
	 * @return
	 */
	@RequestMapping("studyWrite.bo")
	public String studyWrite() {
		return "board/studyBoardWrite";
	}
	
	@RequestMapping("itemBoard")
	public String itemBoardListView() {
		return "board/itemBoardList";
	}
	
	
	
	
	
	
	// -----------희재
	@RequestMapping("studyRoomMainView.bo")
	public String studyRoomMainView(@RequestParam(value="cPage", defaultValue="1") 
									int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.sRoomListCount(), currentPage, 10, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("sRoomList", boardService.selectSRoomList(pi));
		return "board/studyRoomMain";
	}
	
	
	@RequestMapping("studyRoomDetail.bo")
	public String selectStudyRoom(int studyRoomNo, Model model) {
		model.addAttribute("sRoomDetail", boardService.selectStudyRoom(studyRoomNo));
		model.addAttribute("sRoomAttachList", boardService.selectSRoomAttachList(studyRoomNo));
		return "board/studyRoomDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="selectStudyRoomReviewList.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectStudyRoomReviewList(int studyRoomNo) {
		return new Gson().toJson(boardService.selectStudyRoomReviewList(studyRoomNo));
	}
	
	@ResponseBody
	@RequestMapping(value="insertstudyRoomReview.bo", produces="application/json; charset=UTF-8")
	public int ajaxInsertStudyRoomReview(SRoomReview sr) {
		return boardService.insertStudyRoomReview(sr);
	}
	
	@ResponseBody
	@RequestMapping(value="selectStudyRoomReview.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectStudyRoomReview(int reviewNo) {
		return new Gson().toJson(boardService.selectStudyRoomReview(reviewNo));
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReview.bo")
	public int ajaxDeleteReview(int reviewNo) {
		return boardService.deleteStudyRoomReview(reviewNo);
	}
	
	@ResponseBody
	@RequestMapping(value="updateReview.bo", produces="application/json; charset=UTF-8")
	public String ajaxUpdateReview(SRoomReview sr) {
		return new Gson().toJson(boardService.updateStudyRoomReview(sr));
	}
	
	@ResponseBody
	@RequestMapping(value="map.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectAddress() {
		return new Gson().toJson(boardService.selectAddress());
	}
	
	@RequestMapping(value="sRoomSearch.bo")
	public String studyRoomSearch(String searchSelect, String searchText, Model model) {
		HashMap<String, String> map = new HashMap();
		map.put("searchSelect", searchSelect);
		map.put("searchText", searchText);

		model.addAttribute("sRoomList", boardService.studyRoomSearch(map));
		
		return "board/studyRoomMain";
	}
	


	

	
}
