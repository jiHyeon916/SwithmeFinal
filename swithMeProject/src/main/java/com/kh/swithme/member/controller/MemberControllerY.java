package com.kh.swithme.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.swithme.admin.model.service.AdminServiceImpl;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.service.MemberServiceImpl;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.QNA;

@Controller
public class MemberControllerY {

	@Autowired
	private MemberServiceImpl memberService;

	@Autowired
	private AdminServiceImpl adminService;

	
	
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
		
		PageInfo pi = Pagination.getPageInfo(memberService.myPointListCount(memberId), currentPage, 10, 5);
		
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
	
	// 활동내역 페이지
	@RequestMapping("history.me")
	public String myHistoryListView(@RequestParam(value="cPage", defaultValue="1") int currentPage,
									@RequestParam(value="boardType", defaultValue="free") String boardType,
									HttpSession session,
									Model model) {
		
	String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();

	Board b = new Board();
	b.setMemberId(memberId);
	b.setBoardType(boardType);
		
	PageInfo pi = Pagination.getPageInfo(memberService.myBoardListCount(b), currentPage, 5, 5);
		
	model.addAttribute("pi", pi);
	model.addAttribute("list", memberService.myBoardList(pi, b));		
		
		return "member/myHistory";
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
	
	
	
	
	
}
