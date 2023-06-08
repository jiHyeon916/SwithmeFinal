package com.kh.swithme.board.controller;

import java.util.HashMap;

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

@Controller
public class BoardController {

	
	@Autowired
	private BoardServiceImpl boardService;
	
	
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
			System.out.println(boardService.selectBoardList(boardType, pi));
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
			
			model.addAttribute("status", status);
			model.addAttribute("b",boardService.boardDetail(boardNo));
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
	public String insertReply(int boardNo, String rCon) {
		
		System.out.println(boardNo);
		
		Reply r = new Reply();
		r.setBoardNo(boardNo);
		r.setBoardReplyContent(rCon.replace(System.getProperty("line.separator"), "<br>"));
		
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
	public int reReplyBoard(int replyNo, String reReplyCon) {
		ReReply rere = new ReReply();
		rere.setReplyNo(replyNo);
		rere.setReReplyContent(reReplyCon.replace(System.getProperty("line.separator"), "<br>"));
		
		return boardService.reReplyBoard(rere);
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
