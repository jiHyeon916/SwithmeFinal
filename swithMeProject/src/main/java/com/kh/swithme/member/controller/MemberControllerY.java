package com.kh.swithme.member.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.swithme.admin.model.service.AdminServiceImpl;
import com.kh.swithme.board.model.service.BoardServiceImpl;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.Reply;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.service.MemberServiceImpl;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.MemberItem;
import com.kh.swithme.member.model.vo.QNA;

@Controller
public class MemberControllerY {

	@Autowired
	private MemberServiceImpl memberService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private BoardServiceImpl boardService;

	
	
	// 마이페이지 메인으로 이동
	@RequestMapping("mypage.me")
	public String myPageMain() {
		return "member/myPageMain";
	}

	// 보유아이템 페이지
	@RequestMapping("item.me")
	public String myItemListView() {
		return "member/myItem";
	}
	
	// 포인트 페이지 
	@RequestMapping("point.me")
	public String myPointListView(@RequestParam(value="cPage", defaultValue="1") int currentPage, 
								  HttpSession session,
								  Model model) {
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		PageInfo pi = Pagination.getPageInfo(memberService.myPointListCount(memberId), currentPage, 15, 5);
		
		// 보내야할 값
		// 페이징, 포인트내역 리스트, 오늘 얻은 포인트, 토탈포인트
		model.addAttribute("pi", pi); // 페이징
		model.addAttribute("list", memberService.myPointList(pi, memberId)); // 포인트내역 리스트
		model.addAttribute("totalPoint", memberService.selectTotalPoint(memberId)); // 토탈포인트
		model.addAttribute("todayPoint", memberService.todayPoint(memberId)); // 오늘 얻은 포인트
		
		//System.out.println(memberService.myPointList(pi, memberId));
		
		return "member/myPoint";
	}
	
	// 채팅 페이지
	@RequestMapping("chat.me")
	public String chatting() {
		return "member/chatting";
	}
	
	
	// 활동내역 페이지 이동
	@RequestMapping("history.me")
	public String myHistoryListView() {
		return "member/myHistory";
	}
	
	
	// 활동내역 페이지 
	@ResponseBody
	@RequestMapping(value = "historySelectBoard", produces="application/json; charset=UTF-8")
	public String myHistorySelectView(@RequestParam(value="cPage", defaultValue="1") int currentPage, String boardType, String item,
									  Board b, Reply r,
									  HttpSession session,
									  Model model) {
		
		// 변수선언
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		PageInfo pi = null;
		JSONObject jObj = new JSONObject();
		
		if(item.equals("board")) {
			// 게시판을 선택했을 경우
			b.setMemberId(memberId);
			b.setBoardType(boardType);
			
			pi = Pagination.getPageInfo(memberService.myBoardListCount(b), currentPage, 5, 5);
			
			jObj.put("list", memberService.myBoardList(pi, b));
			jObj.put("pi", pi);
			jObj.put("item", item);
			
		} else {
			// 댓글을 선택했을 경우
			r.setMemberId(memberId);
			r.setBoardType(boardType);
			
			pi = Pagination.getPageInfo(memberService.myReplyListCount(r), currentPage, 5, 5);
			
			jObj.put("list", memberService.myReplyList(pi, r));
			jObj.put("pi", pi);
			jObj.put("item", item);
		}
		return new Gson().toJson(jObj);
	};
	
	// 활동내역 삭제(배열)
	@ResponseBody
	@RequestMapping("historyDelete")
	public int qnaDelete(int[] bnoArr, String item, Model model) {
		
		int result = 1;
		
		if(item.equals("board")) {
			for(int i = 0; i < bnoArr.length; i++) {
				result *= boardService.boardDelete(bnoArr[i]);
			}
		} else {
			for(int i = 0; i < bnoArr.length; i++) {
				result *= boardService.replyDelete(bnoArr[i]);
			}
		}
		return result;
	}
	
	
	
	
	// 문의글 페이지
	@RequestMapping("qna.me")
	public String myQnaListView(@RequestParam(value="cPage", defaultValue="1") int currentPage, 
								@RequestParam(value="qnaStatus", defaultValue="all") String qnaStatus, 
								HttpSession session,
								Model model) {
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		QNA qna = new QNA();
		qna.setMemberId(memberId);
		qna.setQnaStatus(qnaStatus);
		
		PageInfo pi = Pagination.getPageInfo(memberService.selectQnaListCount(qna), currentPage, 5, 5);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", memberService.selectQnaList(pi, qna));
		model.addAttribute("qnaStatus", qnaStatus);
		
		return "member/memberQNA";
	}
	
	// 문의글 작성폼
	@RequestMapping("qnaEnroll.me")
	public String qnaEnrollForm() {
		return "member/qnaEnrollForm";
	}
	
	// 문의글 insert
	@RequestMapping(value="insertQna.me", produces="text/html; charset=UTF-8")
	public ModelAndView insertQna(QNA qna, HttpSession session, ModelAndView mv) {
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		qna.setMemberId(memberId);
		
		//int qno = 0;
		
		if(memberService.insertQna(qna) > 0) {
			QNA qnaObj = memberService.selectQnaNo(memberId);
			//qno = qnaObj.getQnaNo();
			//System.out.println(qno);
			mv.setViewName("redirect:qnaDetail.me?qno=" + qnaObj.getQnaNo());
		} else {
			mv.addObject("failMsg", "게시글 작성 실패")
			.setViewName("member/memberQNA");
		}
		
		return mv;
	}
	
	
	// 문의글 상세페이지
	@RequestMapping("qnaDetail.me")
	public String qnaDetailView(int qno, Model model) {
		QNA qna =  memberService.qnaDetailView(qno);
		model.addAttribute("qna", qna);
		return "member/qnaDetailView";
	}
	
	// 문의글 삭제 (배열)
	@ResponseBody
	@RequestMapping("qnaDeleteArr")
	public int qnaDelete(int[] qnoArr, Model model) {
		
		int result = 1;
		
		for(int i = 0; i < qnoArr.length; i++) {
			adminService.qnaReplyDelete(qnoArr[i]);
			result *= memberService.qnaDelete(qnoArr[i]);
		}
		return result;
	}
	
	// 문의글 삭제(상세페이지에서 삭제)
	@RequestMapping("qnaDelete")
	public String qnaDelete(int qno, Model model) {
		
		adminService.qnaReplyDelete(qno);
		
		if(memberService.qnaDelete(qno) > 0) {
			return "redirect:qna.me";
		} else {
			model.addAttribute("failMsg", "게시글 삭제에 실패했습니다.");
			return "redirect:qnaDetail.me?qno=" + qno;
		}
	}
	
	//---------------------------------------------
	
	// 총 포인트 가져오기
	@ResponseBody
	@RequestMapping("miniPoint")
	public int selectTotalPoint(String memberId) {
		return memberService.selectTotalPoint(memberId);
	}
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	@ResponseBody
	@RequestMapping(value="miniPointList", produces="application/json; charset=UTF-8")
	public String selectPointList3(String memberId) {
		return new Gson().toJson(memberService.selectPointList3(memberId));
	}
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	@ResponseBody
	@RequestMapping(value="miniAlarmList", produces="application/json; charset=UTF-8")
	public String selectAlarmList5(String memberId) {
		return new Gson().toJson(memberService.selectAlarmList5(memberId));
	}
	

	// 보유 아이템 리스트
	@ResponseBody
	@RequestMapping(value="selectMyItemList.ad", produces="application/json; charset=UTF-8")
	public String selectMyItemListView(@RequestParam(value="cPage", defaultValue="1") int currentPage,
										HttpSession session, MemberItem mItem, String itemCategory) {
		
		mItem.setMemberId(((Member)session.getAttribute("loginMember")).getMemberId());
		mItem.setItemCategory(itemCategory);
		
		PageInfo pi = Pagination.getPageInfo(memberService.myItemListCount(mItem), currentPage, 12, 5);

		JSONObject jObj = new JSONObject();
		jObj.put("pi", pi);
		jObj.put("list", memberService.myItemList(pi, mItem));
		
		return new Gson().toJson(jObj);
	}

	// 보유 아이템 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteItem.me", produces="application/json; charset=UTF-8")
	public int deleteMyItem(MemberItem mItem) {
		return memberService.deleteMyItem(mItem);
	}
	
	// 사용자 캐릭터 띄우기
	// 카테고리 별로 wearStatus가 'Y' 아이템들을 셀렉해온다
	@ResponseBody
	@RequestMapping(value="myCharacter.me", produces="application/json; charset=UTF-8")
	public String myCharacter(String memberId) {
		return new Gson().toJson(memberService.myCharacter(memberId));
	}
	
	// 사용자 아이템 착용 상태 변경
	@ResponseBody
	@RequestMapping(value="wearUpdate.me", produces="application/json; charset=UTF-8")
	public int wearUpdate(MemberItem mItem, int wearItemNo) {
		
		// mItem : 내가 갈아입을 옷 -> memberId, itemNo
		// wearItemNo : 내가 입고있던옷의 번호 -> memberId, itemNo
		MemberItem cItem = new MemberItem();
		cItem.setMemberId(mItem.getMemberId());
		cItem.setItemNo(wearItemNo);
		cItem.setItemCategory(mItem.getItemCategory());
		cItem.setWearStatus("N");
		int result = 0;

		if(memberService.wearStatusUpdate(cItem) > 0) {
			result = memberService.wearStatusUpdate(mItem);
		};
		
		return result;
	}
	

	// 마이페이지 메인 - 작성글목록
	@ResponseBody
	@RequestMapping(value="myPostList.me", produces="application/json; charset=UTF-8")
	public String mainPostListView(String memberId) {
		return new Gson().toJson(memberService.mainPostList(memberId));
	}
	
	
	
	
}
