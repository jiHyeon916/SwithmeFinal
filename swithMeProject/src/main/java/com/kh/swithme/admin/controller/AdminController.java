package com.kh.swithme.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.swithme.admin.model.service.AdminService;
import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class AdminController {
   
   @Autowired
   private AdminService adminService;
   

   
	
   
   
   
   
   //지현
   // 사용자들 모두 조회
   @RequestMapping("adminMember.ad")
   public ModelAndView adminMember(ModelAndView mv, @RequestParam(value="amPage", defaultValue="1")int currentPage) {
                                       //getParameter같은 존재 , 특정값이 넘어오지않으면 기본값 1로 넘어오게 설정         
      //페이징처리
      //회원의 count가져오기(DB)
      PageInfo pi = Pagination.getPageInfo(adminService.selectMemberCount(), currentPage, 5, 10);
      
      
      
      //리스트 넘기기
     mv.addObject("pi", pi);
     mv.addObject("memList", adminService.adminMemberList(pi)); //memList 가 Key값
     mv.setViewName("admin/adminMember");
     return mv; 
      

   }
   
   //검색 결과
   @RequestMapping("adminMemberSearch.ad")
   public ModelAndView adminMemberSearch(@RequestParam(value="amPage", defaultValue="1")int currentPage, 
                              String keyword, 
                              String condition 
                              ,ModelAndView mv 
                              ) {
      //System.out.println(currentPage);
      //System.out.println(keyword);
      //System.out.println(condition);
    
      //Map에 String 2개를 담기.(키워드값, 옵션 담기)
      HashMap<String, String> map = new HashMap();
      map.put("condition", condition);
      map.put("keyword", keyword);
      
     // System.out.println(adminService.selectMemberSearchCount(map));
      
      
      //페이징처리(키워드가 포함된 글의 개수)
      PageInfo pi = Pagination.getPageInfo(adminService.selectMemberSearchCount(map), currentPage, 5, 10);
     
      //System.out.println(pi);
      ArrayList<Member> searchList =  adminService.selectMemberSearchList(map,pi);
      //System.out.println(searchList);
      
      
      //페이징 처리된 결과ArrayList
      mv.addObject("searchList",searchList); //list결과->key값 searchList
      mv.addObject("pi",pi);
      mv.addObject("keyword", keyword);
      mv.addObject("condition", condition);
      mv.setViewName("admin/adminMemberSearch");
      
      
      
      //검색 결과가 없을땐 조회된 결과가 없습니다. 뿌려주기
      
      //검색한 키워드 검색창에 그대로 
      return mv;
   }
   
   
   //회원 상태 조회
   @ResponseBody
   @RequestMapping("memberStatusSelect.ad")
   public String memberStatus(String memberId) {
      
      Member m = adminService.memberStatus(memberId);
      return m.getMemberStatus();
   }
   
  
   
   
   
   //회원 정지 해제 (앞단 해야함..)
   @ResponseBody
   @RequestMapping("adminMemberStopFree.ad")
   public char memberStopFree(String memberId) {
   //   System.out.println(memberId);
     return adminService.memberStopFree(memberId) > 0 ? 'Y' : 'N';
   }
   
   //회원 정지 
   @ResponseBody
   @RequestMapping("adminMemberStop.ad")
   public char memberStop(String memberId, HttpSession session) {
	   
		   
		   return adminService.memberStop(memberId) > 0 ? 'Y' : 'N';
	   }
	
	   
	   
    //  System.out.println(memberId);
     
     
   
   
   /*
   //회원 디테일 조회정보(select)
   @RequestMapping("memberDetailInfo.ad")
   public ModelAndView memberDetailInfo(String memberId, ModelAndView mv) {
      
      //System.out.println(memberId);
    
	   ArrayList<Board> memberBoardList = adminService.memberDetailInfo(memberId);
	   mv.addObject("memberBoardList", memberBoardList);
       mv.setViewName("admin/memberDetailInfo");
       return mv;
   }*/
   
   
   
   
   //디테일info로 이동(+회원정보 가지고)
   @RequestMapping("memberDetailInfo.ad")
   public ModelAndView memberDetailInfo(String memberId, HttpSession session, ModelAndView mv) {
	    
	   //System.out.println(memberId);
	   Member m = adminService.memberInfo(memberId);
	   //System.out.println(m);
	   
	   mv.addObject("m", m);
	   mv.setViewName("admin/memberDetailInfo");
	   
	   return mv;
	  
	   
	   
	   // mv.addObject("memberId", memberId);
	   //memberId로 회원 정보 가져오기
	  // mv.setViewName("admin/memberDetailInfo");
	   
	  
	   
   }
   
   
   //회원 디테일 조회정보(select) board
   @ResponseBody
   @RequestMapping(value="memberDetailBoardList.ad", produces="application/json; charset=UTF-8")
   public String memberDetailBoard(String memberId) {
	  
	   //System.out.println(memberId);
	   
	   ArrayList<Board> list = adminService.memberDetailBoard(memberId);
	   //ArrayList<Band> Slist = adminService.memberDetailBand(memberId);
	   
	  // System.out.println(list);
	   
	   return new Gson().toJson(list);
   }
   
   //회원 디테일 조회정보(select) band
  @ResponseBody
  @RequestMapping(value="memberBandList.ad", produces="application/json; charset=UTF-8")
  public String memberBandList(String memberId) {
	  
	  ArrayList<Band> list = adminService.memberDetailBand(memberId);
	  //System.out.println(list);
	  
	  return new Gson().toJson(list);
		
  }
   
  
  
	/*
	 * @RequestMapping("memberReplyList.ad") public String memberReplyList(String
	 * memberId) {
	 * 
	 * adminService.memberReplyList(memberId) }
	 * 
	 */
  
  // 회원 board삭제
  @ResponseBody
  @RequestMapping("deleteBoardDetail.ad")
  public int deleteBoardDetail(int[] boardNo) {
	  
	  int result = 1;
	  //System.out.println(boardNo);
	  
	  for(int i = 0; i <boardNo.length; i++) {
		  result *= adminService.deleteBoardDetail(boardNo[i]);
		  
	  }
	  //System.out.println(result);
	  
	 return result;
	  
	  //return adminService.deleteBoardDetail(boardNo) > 0 ? 'Y' : 'N';
  
  
  }
  
  // 회원 band삭제
  @ResponseBody
  @RequestMapping("deleteBandDetail.ad")
  public int deleteBandDetail( @RequestParam("bandNo")int[] bandNo) {
	  
	  
	  int result = 1;
	  System.out.println(bandNo + "넘버");
	  
	  for(int i = 0; i <bandNo.length; i++) {
		  result *= adminService.deleteBandDetail(bandNo[i]);
		  
	  }
	  System.out.println(result + "result");
	  
	 return result;
	  //return adminService.deleteBandDetail(boardNo) > 0 ? 'Y' : 'N';
  }
  
  
  
  //회원 board 글 검색(게시글 제목)
  
  @ResponseBody
  @RequestMapping(value="memBoardSearchTitle.ad",  produces="application/json; charset=UTF-8")
  public String memBoardSearch(String memberId, String keyword) {
	  
	  
	  HashMap<String, String> map = new HashMap();
	  map.put("keyword",keyword);
	  map.put("memberId", memberId);
	  
	  ArrayList<Board> list = adminService.memBoardSearch(map);
	
	  //System.out.println(list);
	  
	 return new Gson().toJson(list);
  }
 
 
  // 회원 board글 검색(게시글 내용)
   @ResponseBody
   @RequestMapping(value="memBoardSearchContent.ad", produces="application/json; charset=UTF-8")
   public String memSearchContent(String memberId, String keyword) {
	   
	   //System.out.println(keyword);
	   HashMap<String, String> map = new HashMap();
	   map.put("keyword", keyword);
	   map.put("memberId", memberId);
	   
	   ArrayList<Board> list = adminService.memSearchContent(map);
	   
	   //System.out.println(list);
	   
	   return new Gson().toJson(list);
   }
  
  
   //회원  band글 검색(게시글 제목)
   @ResponseBody
   @RequestMapping(value="memBandSearchTitle.ad", produces="application/json; charset=UTF-8")
   public String memBandSearchTitle(String memberId, String keyword) {
	   
	   HashMap<String, String> map = new HashMap();
	   map.put("keyword", keyword);
	   map.put("memberId", memberId);
	   
	   ArrayList<Band> list = adminService.memBandSearchTitle(map);
	   
	   //System.out.println(list);
	   
	   return new Gson().toJson(list);
   }
   
   //회원 band글 검색(게시글 내용)
   @ResponseBody
   @RequestMapping(value="memBandSearchContent.ad", produces="application/json; charset=UTF-8")
   public String memBandSearchContent(String memberId, String keyword) {
	   
	   HashMap<String,String> map = new HashMap();
	   map.put("keyword", keyword);
	   map.put("memberId", memberId);
	   
	   ArrayList<Band> list = adminService.memBandSearchContent(map);
	   
	   System.out.println(list);
	   
	   return new Gson().toJson(list);
   }
   
  
  
  
  
  
  
  
  
  
  
   // 이유진 ------------------------------------------------------------

  	// 관리자 메인페이지
  	@RequestMapping("adPage.ad")
  	public String adminPageMain() {
	  	return "admin/adminPageMain";
  	}
  
  	// 관리자 아이템관리 페이지 
	@RequestMapping("itemList.ad")
	public String adminItemListView() {
		return "admin/adminItemListView";
	}
  
  	// 관리자 아이템등록 페이지 
	@RequestMapping("itemEnrollForm.ad")
	public String adminItemEnrollForm() {
		return "admin/adminItemEnrollForm";
	}
   
   // 문의글 답변 INSERT
	@ResponseBody
	@RequestMapping("qnaAnswer")
	public String insertQnaReply(QNAReply qr) {
		return adminService.insertQnaReply(qr) > 0 ? "success" : "fail";

	}
	
	// 문의글 답변 목록 출력
	@ResponseBody
	@RequestMapping(value="qnaAnswerList", produces="application/json; charset=UTF-8")
	public String selectQnaReply(int qnaNo) {
		return new Gson().toJson(adminService.selectQnaReply(qnaNo));

	}
	
	// 문의글 답변여부 상태변화
	@ResponseBody
	@RequestMapping("qnaAnswerUpdate")
	public String qnaStatusUpdate(int qnaNo) {
		return adminService.qnaStatusUpdate(qnaNo) > 0 ? "success" : "fail";
	}
	
	
	
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  // 김희재 ------------------------------------------------------------
	
	// 스터디룸 관리
	// 스터디룸 조회
	@RequestMapping("adminStudyRoom.ad")
	public String adminStudyRoomMain(Model model, @RequestParam(value="aPage", defaultValue="1")int currentPage ) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.adminStudyRoomListCount(), currentPage, 10, 10);
		
		model.addAttribute("list", adminService.selectAllStudyRoomList(pi));
		model.addAttribute("pi", pi);

		System.out.println(adminService.adminStudyRoomListCount());
		System.out.println(adminService.selectAllStudyRoomList(pi));
		return "admin/adminStudyRoom";
	}
	
	// 스터디룸 추가
	@RequestMapping("adminstudyRoomInsert.ad")
	public String adminstudyRoomInsert() {
		return "admin/adminStudyRoomEnrollForm";
	}
	
	
	
	
	// 스터디룸 삭제
	@ResponseBody
	@RequestMapping(value="deleteCheckStudyRoom.ad", produces="application/json; charset=UTF-8")
	public int deleteCheckStudyRoom(@RequestParam(value="studyRoomNo[]")int[] studyRoomNo) {
		
		int result = 1;
		for(int i = 0; i < studyRoomNo.length; i++) {
			result = adminService.deleteCheckStudyRoom(studyRoomNo[i]);
		}
		return result;
	}

	
	
	
	
	//스터디밴드
	@RequestMapping("adminStudyBand.ad")
	public String adminStudyBandMain() {
		return "admin/adminStudyBand";
	}
	
	
   
   
   
   
}
