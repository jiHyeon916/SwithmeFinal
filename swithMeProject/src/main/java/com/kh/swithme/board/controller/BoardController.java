package com.kh.swithme.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.swithme.admin.model.vo.Report;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.service.BoardServiceImpl;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.ReReply;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.service.MemberServiceImpl;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class BoardController {


	@Autowired
	private BoardServiceImpl boardService;

	@Autowired
	private MemberServiceImpl memberService;



	// 혜린
	/**
	 * 자유게시판 게시글 수 조회 !!!이거 보드타입별로 따로 조회해야하는거 아님>.!?!?!?
	 * @return 자유게시판
	 */
	@ResponseBody
	@RequestMapping("boardCount.bo")
	public int boardCount(int boardType) {
		return boardService.boardCount(boardType);
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
	 * 인기글 top5 조회 
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="topBoard.bo", produces="application/json; charset=UTF-8")
	public String topBoard() {
		return new Gson().toJson(boardService.topBoard()); 
	}

	/**
	 * 인기글 top5 조회 
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="topBoard2.bo", produces="application/json; charset=UTF-8")
	public String topBoard2() {
		return new Gson().toJson(boardService.topBoard2()); 
	}

	/**
	 * 게시글 상세 보기 
	 * @param boardNo 조회할 게시글 번호
	 * @return 게시판 상세 페이지
	 */
	@RequestMapping("freeBoardDetail.bo")
	public String boardDetail(int boardNo, String memberId, Model model) {

		Board bBoard = new Board();
		bBoard.setBoardNo(boardNo);
		bBoard.setMemberId(memberId);

		if(boardService.boardCountUp(boardNo) > 0) {
			// 로그인 유저가 좋아요 한상태인지 아닌
			Board status = new Board();
			status.setLikeStatus(boardService.likeStatus(bBoard));
			status.setBookStatus(boardService.bookStatus(bBoard));

			Board b = boardService.boardDetail(boardNo);
			String tagList = b.getTagList();
			if(tagList != null) {
				String[] tag = tagList.split(",");
				model.addAttribute("tag", tag);
			}

			model.addAttribute("status", status);
			model.addAttribute("b", b);

			if(b.getBoardType().equals("free")) {
				return "board/freeBoardDetail";
			}else {
				return "board/infoBoardDetail";
			}


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
	public String likeStatus(int boardNo, String memberId, Model model) {
		Board b = new Board();
		b.setMemberId(memberId);
		b.setBoardNo(boardNo);

		int likeStatus = boardService.likeStatus(b);

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
	public String likeBoard(Board b) {

		int likeStatus = boardService.likeStatus(b);

		if(likeStatus > 0) {
			return new Gson().toJson(boardService.removeLike(b));
		}else {
			return new Gson().toJson(boardService.likeBoard(b));
		}
	}
	/**
	 * 북마크 상태 확인 (나중에 로그인 유저 확인해야함)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("bookStatus.ck")
	public String bookStatus(Board b) {

		int bookStatus = boardService.bookStatus(b);

		return new Gson().toJson(bookStatus);
	}
	/**
	 * 북마크 하기
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("book.bo")
	public String bookBoard(Board b) {

		int bookStatus = boardService.bookStatus(b);
		if(bookStatus > 0) {
			return new Gson().toJson(boardService.removeBook(b));
		}else {
			return new Gson().toJson(boardService.bookBoard(b));
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

		if(boardService.insertReply(r) > 0) {
			boardService.insertReplyAlarm(boardNo);
			return "success";
		}
		return "fail";

	}
	/**
	 * 댓글 수 카운트
	 * @param boardNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("replyCount.bo")
	public int replyCount(int boardNo) {
		return boardService.replyCount(boardNo) + boardService.rereplyCount(boardNo);
	}

	/**
	 * 대댓글 작성
	 * @param replyNo
	 * @param reReplyCon
	 * @return
	 */
	@ResponseBody
	@RequestMapping("reReply.bo")
	public int reReplyBoard(int boardNo, int replyNo, String reReplyCon, String memberId) {
		ReReply rere = new ReReply();
		rere.setReplyNo(replyNo);
		rere.setReReplyContent(reReplyCon.replace(System.getProperty("line.separator"), "<br>"));
		rere.setMemberId(memberId);
		rere.setReReplyNo(boardNo);

		if(boardService.reReplyBoard(rere) > 0) {
			boardService.reReplyBoardAlarm(rere);
			return 1;
		}
		return 0;


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
			if(tagList.length() > 3) {
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
	 * 대댓글 수정 
	 * @param re 수정할 댓글 번호 ,컨텐츠 내용 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("reReplyModify.bo")
	public String reReplyModify(ReReply re) {

		return boardService.reReplyModify(re) > 0 ? "success" : "fail";
	}

	/**
	 * 댓글 대댓글 삭제
	 * @param reType
	 * @param replyNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteRe.bo")
	public int deleteRe(int reType, int replyNo) {
		Reply r = new Reply();
		r.setBoardNo(reType);
		r.setBoardReplyNo(replyNo);

		return boardService.deleteRe(r);
	}

	/**
	 * 게시글 삭제 
	 * @param boardNo 삭제할 게시글 넘버 
	 * @param model
	 * @return
	 */
	@RequestMapping("boardDelete.bo")
	public String boardDelete(int boardNo, Model model, HttpSession session) {
		if(boardService.boardDelete(boardNo) > 0) {
			session.setAttribute("alertMsg", "게시글이 성공적으로 삭제 되었습니다.");
			return "redirect:freeBoardListView.bo?boardType=1";
		}else {
			session.setAttribute("alertMsg", "게시글 삭제에 실패했습니다.");
			return "redirect:freeBoardDetail.bo?boardNo=" + boardNo ;
		}
	}

	/**
	 * 스터디 모집하기 글 작성 화면
	 * @return
	 */
	@RequestMapping("studyWrite.bo")
	public String studyWrite() {
		return "board/studyBoardWrite";
	}

	/**
	 * 스터디 밴드 게시글 
	 * @param memberId 방장 아이디 
	 * @param bCon 스터디 소개 내용 
	 * @param summary 요약 
	 * @param title 방 이름 
	 * @param category 방 카테고리 분류 
	 * @param perNum 모집 인원 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "studyBandInsert.bo", produces="application/text; charset=utf8")
	public String studyBandInsert(Band b, String memberId, String bCon,String title, String category, MultipartFile please, Integer perNum, HttpSession session) {

		b.setSbCategory(category);
		b.setMemberId(memberId);
		b.setSbTitle(title);
		b.setSbRecruitMem(perNum);
		b.setSbIntroduce(bCon);


		if(!please.getOriginalFilename().equals("")){
			if(b.getSbChangeName() != null) {
				new File(session.getServletContext().getRealPath(b.getSbChangeName())).delete();
			}
			String changeName = saveFile(please, session);

			b.setSbChangeName("/swithme/resources/uploadFiles/band/" + changeName);
		}

		if(boardService.studyBandInsert(b) > 0) {
			if(boardService.studyMemberInsert(memberId) > 0) {
				return "success";
			}
			return "fail";
		}else {
			return "fail";
		}


	}

	// 사진 사용
	public String saveFile(MultipartFile upfile, HttpSession session) { 
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/band/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}

	/**
	 * 밴드 카테고리 
	 * @param currentPage
	 * @param category
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bandCateogory", produces="application/json; charset=UTF-8")
	public String bandCateogory(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			String category, Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.boardCategoryCount(category), currentPage, 20, 10);

		JSONObject jobj = new JSONObject();
		jobj.put("list", boardService.bandCateogoryList(category, pi));
		jobj.put("pi", pi);
		return new Gson().toJson(jobj);
	}

	/**
	 * 밴드 찾기 (검색어)
	 * @param key
	 * @return
	 */
	@RequestMapping("bandSearch")
	public String bandSearch(@RequestParam(value="cPage", defaultValue="1") int currentPage, String key, Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.bandSearchCount(key), currentPage, 20, 10);
		model.addAttribute("list", boardService.bandSearch(key, pi));
		return "board/studyBandBoardListView";

	}

	/**
	 * 아이템 보드 리스트 페이지로 이동 
	 */
	@RequestMapping("itemBoard")
	public String itemBoardListView(Model model) {
		model.addAttribute("item", boardService.itemBoard());
		return "board/itemBoardList";
	}


	/**
	 * 정보 게시판 : 채택된 글 가져오기 
	 * @param boardNo 조회한 게시판 번호 
	 * @return 
	 */
	@ResponseBody
	@RequestMapping(value="selectioncheck", produces="application/json; charset=UTF-8")
	public String selectioncheck(int boardNo) {

		Reply r = boardService.selectioncheck(boardNo);

		if(r == null) {
			return "NO";
		}else {
			return new Gson().toJson(r); 
		}
	}

	/**
	 * 정보 게시판 : 답변 채택하기 
	 * @param replyNo 채택할 댓글 번호 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectInsert")
	public String selectInsert(int replyNo) {

		if(boardService.selectInsert(replyNo) > 0) {
			if(boardService.selectPoint(replyNo) > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		return "fail";

	}
	/**
	 * 로그인 유저의 총 포인트 가져오기 
	 * @param memberId 로그인 유저
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getTotalPoint.bo")
	public int getTotalPoint(String memberId, HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return memberService.selectTotalPoint(memberId);
		}
		return 0;
	}

	/**
	 * 아이템 구매하기 (임시로 Board에 값 담아서 전송)
	 * @param itemNo 구매할 아이템 번호 
	 * @param point 아이템 가격
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("itemGet")
	public int itemGet(int itemNo, int point, HttpSession session) {

		if(session.getAttribute("loginMember") != null) {
			String id = ((Member)session.getAttribute("loginMember")).getMemberId();
			Board b = new Board();
			b.setMemberId(id);
			b.setCount(point);
			b.setLikeCount(itemNo);

			if(boardService.itemCheck(b) > 0 ) {
				return -1;
			}else {
				if(boardService.itembuyPoint(b) > 0) {
					return boardService.itemGet(b);
				}
			}
			return 0;
		}else {
			return 0;
		}

	}

	/**
	 * 캐릭터 배경화면
	 * @param category 적용할 카테고리
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="itemListUpdate", produces="application/json; charset=UTF-8")
	public String itemListUpdate(String category) {

		JSONObject jobj = new JSONObject();
		jobj.put("list", boardService.itemListUpdate(category));
		// jobj.put("pi", pi);
		return new Gson().toJson(jobj);
	}

	/**
	 * 게시글 신고하기 
	 * @param r
	 * @return
	 */
	@ResponseBody
	@RequestMapping("boardReport.bo")
	public int boardReport(Report r) {

		return boardService.boardReport(r);
	}

	/**
	 * 아이템 검색 창 
	 * @param key 검색키워드
	 * @param model 검색결과리스트 
	 * @return 아이템 리스트 페이지 
	 */
	@RequestMapping("itemSearch.bo")
	public String itemSearch(String key, Model model) {
		model.addAttribute("item", boardService.itemSearch(key));
		return "board/itemBoardList";
	}

	/**
	 * 캐릭터 이미지 가져오기 
	 * @param memberId 가져올 멤버 아이디 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="memberImg", produces="application/json; charset=UTF-8")
	public String memberImg(String memberId) {
		return new Gson().toJson(boardService.memberImg(memberId));
	}

	@ResponseBody
	@RequestMapping(value="boardlist", produces="application/json; charset=UTF-8")
	public String boardlist(int boardNo) {
		return new Gson().toJson(boardService.boardlist(boardNo));
	}




	// ********************* 메인..
	@ResponseBody
	@RequestMapping(value="mainStudy", produces="application/json; charset=UTF-8")
	public String mainStudy(String category) {
		return new Gson().toJson(boardService.mainStudy(category));

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
	@RequestMapping(value="updateReview.bo")
	public int ajaxUpdateReview(SRoomReview sr) {
		return boardService.updateStudyRoomReview(sr);
	}

	@ResponseBody
	@RequestMapping(value="allMap.bo", produces="application/json; charset=UTF-8")
	public HashMap<String, Object> ajaxSelectAddress() {
		HashMap<String, Object> data = new HashMap<>();
		data.put("all", boardService.selectAddress());
		return data;
	}

	@ResponseBody
	@RequestMapping(value="search.bo", produces="application/json; charset=UTF-8")
	public HashMap<String, Object> ajaxSearch(String searchSelect, String searchText) {
		HashMap<String, Object> data = new HashMap<>();
		HashMap<String, String> map = new HashMap<>();
		map.put("searchSelect", searchSelect);
		map.put("searchText", searchText);

		data.put("search", boardService.selectAddressSearch(map));
		data.put("searchList", boardService.studyRoomSearch(map));

		return data;
	}


}
