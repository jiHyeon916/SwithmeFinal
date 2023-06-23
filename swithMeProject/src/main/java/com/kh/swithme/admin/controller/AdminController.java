package com.kh.swithme.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.swithme.admin.model.service.AdminService;
import com.kh.swithme.admin.model.vo.Item;
import com.kh.swithme.admin.model.vo.QNAReply;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.StudyRoom;
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
      //Map에 String 2개를 담기.(키워드값, 옵션 담기)
      HashMap<String, String> map = new HashMap();
      map.put("condition", condition);
      map.put("keyword", keyword);
      
      
      //페이징처리(키워드가 포함된 글의 개수)
      PageInfo pi = Pagination.getPageInfo(adminService.selectMemberSearchCount(map), currentPage, 5, 10);
     
      ArrayList<Member> searchList =  adminService.selectMemberSearchList(map,pi);
      
      
      //페이징 처리된 결과ArrayList
      mv.addObject("searchList",searchList); //list결과->key값 searchList
      mv.addObject("pi",pi);
      mv.addObject("keyword", keyword);
      mv.addObject("condition", condition);
      mv.setViewName("admin/adminMemberSearch");
      
      return mv;
      }
   
   
   //회원 상태 조회
   @ResponseBody
   @RequestMapping("memberStatusSelect.ad")
   public String memberStatus(String memberId) {
      
      Member m = adminService.memberStatus(memberId);
      return m.getMemberStatus();
   }
   
   
   
   //회원 정지 해제 
   @ResponseBody
   @RequestMapping("adminMemberStopFree.ad")
   public char memberStopFree(String memberId) {
     return adminService.memberStopFree(memberId) > 0 ? 'Y' : 'N';
   }
   
   //회원 정지 
   @ResponseBody
   @RequestMapping("adminMemberStop.ad")
   public char memberStop(String memberId, HttpSession session) {
	 return adminService.memberStop(memberId) > 0 ? 'Y' : 'N';
   }
   
   
   
   
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
	   
	   System.out.println(list);
	   
	   return new Gson().toJson(list);
   }
   
   //회원 디테일 조회정보(select) band
  @ResponseBody
  @RequestMapping(value="memberBandList.ad", produces="application/json; charset=UTF-8")
  public String memberBandList(String memberId) {
	  
	  ArrayList<Band> list = adminService.memberDetailBand(memberId);
	  System.out.println(list);
	  
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
  public int deleteBoardDetail(@RequestParam("boardNo")int[] boardNo) {
	  
	  int result = 1;
	  System.out.println(boardNo);
	  
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
	 // System.out.println(result + "result");
	  
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
	
	// 관리자 아이템관리
	@RequestMapping("itemList.ad")
	public String adminItemListView() {
		return "admin/adminItemListView";
	}
	
	// 관리자 아이템목록
	@ResponseBody
	@RequestMapping(value="selectItemList.ad", produces="application/json; charset=UTF-8")
	public String selectItemListView(@RequestParam(value="cPage", defaultValue="1") int currentPage,
									 Item item, String itemCategory, String itemStatus, Model model) {
		
		item.setItemCategory(itemCategory);
		item.setItemStatus(itemStatus);
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectItemListCount(item), currentPage, 12, 5);
		
		JSONObject jObj = new JSONObject();
		jObj.put("pi", pi);
		jObj.put("list", adminService.selectItemList(pi, item));
		
		return new Gson().toJson(jObj);
	};
	
	// 관리자 아이템등록 페이지
	@RequestMapping("itemEnrollForm.ad")
	public String adminItemEnrollForm() {
		return "admin/adminItemEnrollForm";
	}
	
	// 관리자 아이템등록
	@RequestMapping("insertItem.ad")
	public String insertItem(Item item, MultipartFile upFile, HttpSession session, Model model) {
		if(!upFile.getOriginalFilename().equals("")) {
			item.setItemPhoto("resources/uploadFiles/item/" + saveFile(upFile, session, "item"));
		}
		if(adminService.insertItem(item) > 0) {
			return "redirect:itemList.ad";
		} else {
			model.addAttribute("failMsg", "아이템 등록 실패");
			return "redirect:itemList.ad";
		}
	}

	// 관리자 아이템 상태변경
	@ResponseBody
	@RequestMapping(value="itemSatusUpdate.ad", produces="application/json; charset=UTF-8")
	public int itemStatusUpdate(Item item) {
		return adminService.itemStatusUpdate(item);
	};
	
	// 관리자 아이템 수정
	@ResponseBody
	@RequestMapping("itemUpdate.ad")
	public int itemUpdate(Item item, String originPhoto, MultipartFile reUpFile, HttpSession session) {
		// 1) 원본사진 O / 내용변경 O
		// 2) 새사진 O / 내용변경 O
		// 3) 새사진 O / 내용변경 X
		if(!reUpFile.getOriginalFilename().equals("")) {
			// 새로 첨부된 사진이 있을 경우 -> 기존에 있던 사진 delete & 사진 insert & 전체 update
			new File(session.getServletContext().getRealPath(originPhoto)).delete();
			String changeName = "resources/uploadFiles/item/" + saveFile(reUpFile, session, "item");
			item.setItemPhoto(changeName);
		} else {
			item.setItemPhoto(originPhoto);
		}
		return adminService.itemUpdate(item);
	};
	
	// 사진 사용 메소드
	public String saveFile(MultipartFile upfile, HttpSession session, String type) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/item/");
		String studyRoomSavePath = session.getServletContext().getRealPath("/resources/uploadFiles/admin/");
		try {
			if(type.equals("study")) {
				upfile.transferTo(new File(studyRoomSavePath + changeName));
			} else {
				upfile.transferTo(new File(savePath + changeName));
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
		
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  // 김희재 ------------------------------------------------------------
	
	// 스터디룸 관리
	// 스터디룸 조회
	@RequestMapping("adminStudyRoom.ad")
	public String adminStudyRoomMain(Model model, @RequestParam(value="aPage", defaultValue="1")int currentPage ) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.adminStudyRoomListCount(), currentPage, 10, 10);
		
		model.addAttribute("list", adminService.selectAllStudyRoomList(pi));
		model.addAttribute("pi", pi);

		return "admin/adminStudyRoom";
	}
	
	// 스터디룸 추가 페이지로 이동
	@RequestMapping("adminstudyRoomInsert.ad")
	public String adminstudyRoomInsert() {
		return "admin/adminStudyRoomEnrollForm";
	}
	
	// 스터디룸 추가
	@RequestMapping("insertStudyRoom.ad")
	public String insertStudyRoom(StudyRoom sr, Attach at, @RequestParam("upFile[]") MultipartFile[] upFiles, @RequestParam("checkThumnail") int value, HttpSession session, Model model) {
		switch(sr.getStudyRoomLocation()) {
			case "10" : sr.setStudyRoomLocation("강원");break;
			case "20" : sr.setStudyRoomLocation("경기");break;
			case "30" : sr.setStudyRoomLocation("경남");break;
			case "40" : sr.setStudyRoomLocation("경북");break;
			case "50" : sr.setStudyRoomLocation("광주");break;
			case "60" : sr.setStudyRoomLocation("대구");break;
			case "70" : sr.setStudyRoomLocation("대전");break;
			case "80" : sr.setStudyRoomLocation("부산");break;
			case "90" : sr.setStudyRoomLocation("서울");break;
			case "11" : sr.setStudyRoomLocation("세종");break;
			case "12" : sr.setStudyRoomLocation("울산");break;
			case "13" : sr.setStudyRoomLocation("인천");break;
			case "14" : sr.setStudyRoomLocation("전남");break;
			case "15" : sr.setStudyRoomLocation("전북");break;
			case "16" : sr.setStudyRoomLocation("제주");break;
			case "17" : sr.setStudyRoomLocation("충남");break;
			case "18" : sr.setStudyRoomLocation("충북");break;
		}
		int result1 = adminService.insertStudyRoom(sr);
		int result2 = 1;
		for(int i = 0; i < upFiles.length; i++) {
			MultipartFile upFile = upFiles[i];
			if (!upFile.getOriginalFilename().equals("")) {
				at.setOriginName(upFile.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/admin/" + saveFile(upFile, session, "study"));
				if(value == i) {
					at.setFileLevel(1);
				} else {
					at.setFileLevel(2);
				}
				result2 = adminService.insertStudyRoomImage(at);
			}
		}
		if((result1 * result2) > 0) {
			return "redirect:adminStudyRoom.ad";
		} else {
			System.out.println("실패");
			return "redirect:adminStudyRoom.ad";
		}
	}

	// 스터디룸 수정화면 
	@RequestMapping("updateStudyRoomForm.ad")
	public String updateStudyRoomForm(int studyRoomNo, Model model) {
		model.addAttribute("studyRoom", adminService.selectStudyRoom(studyRoomNo));
		model.addAttribute("imageList", adminService.selectStudyRoomImage(studyRoomNo));
		return "admin/adminStudyRoomUpdateForm";
	}

	// 스터디룸 수정
	@RequestMapping("updateStudyRoom.ad")
	public String updateStudyRoom(StudyRoom sr, Attach at, @RequestParam("reUpFile[]") MultipartFile[] reUpFiles, @RequestParam("checkThumnail") int value, @RequestParam("originName") String origin, HttpSession session, Model model) {
		System.out.println(at);
		switch(sr.getStudyRoomLocation()) {
			case "10" : sr.setStudyRoomLocation("강원");break;
			case "20" : sr.setStudyRoomLocation("경기");break;
			case "30" : sr.setStudyRoomLocation("경남");break;
			case "40" : sr.setStudyRoomLocation("경북");break;
			case "50" : sr.setStudyRoomLocation("광주");break;
			case "60" : sr.setStudyRoomLocation("대구");break;
			case "70" : sr.setStudyRoomLocation("대전");break;
			case "80" : sr.setStudyRoomLocation("부산");break;
			case "90" : sr.setStudyRoomLocation("서울");break;
			case "11" : sr.setStudyRoomLocation("세종");break;
			case "12" : sr.setStudyRoomLocation("울산");break;
			case "13" : sr.setStudyRoomLocation("인천");break;
			case "14" : sr.setStudyRoomLocation("전남");break;
			case "15" : sr.setStudyRoomLocation("전북");break;
			case "16" : sr.setStudyRoomLocation("제주");break;
			case "17" : sr.setStudyRoomLocation("충남");break;
			case "18" : sr.setStudyRoomLocation("충북");break;
		}
		
		int result1 = adminService.updateStudyRoom(sr);
		int result2 = 1;
		for(int i = 0; i < reUpFiles.length; i++) {
			MultipartFile reUpFile = reUpFiles[i];
			if (!reUpFile.getOriginalFilename().equals("")) {
				new File(session.getServletContext().getRealPath(origin)).delete();
				at.setOriginName(reUpFile.getOriginalFilename());
				at.setChangeName("resources/uploadFiles/admin/" + saveFile(reUpFile, session, "study"));
				if(value == i) {
					at.setFileLevel(1);
				} else {
					at.setFileLevel(2);
				}
				result2 = adminService.updateStudyRoomImage(at);
			} else {
				System.out.println(origin);
				at.setOriginName(origin);
				result2 = adminService.updateStudyRoomImage(at);
			}
		}
		if((result1 * result2) > 0) {
			return "redirect:adminStudyRoom.ad";
		} else {
			System.out.println("실패");
			return "redirect:adminStudyRoom.ad";
		}

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




}
