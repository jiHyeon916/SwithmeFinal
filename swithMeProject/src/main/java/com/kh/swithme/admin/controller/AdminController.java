package com.kh.swithme.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.swithme.admin.model.service.AdminService;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	

	// 이유진
	@RequestMapping("adPage.ad")
	public String adminPageMain() {
		return "admin/adminPageMain";
	}
	
	@RequestMapping("itemList.ad")
	public String adminItemListView() {
		return "admin/itemManagement";
	}
	
	
	
	
	
	
	
	
	
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
      
	 
	   //Map에 String 2개를 담기.(키워드값, 옵션 담기)
	   HashMap<String, String> map = new HashMap();
	   map.put("condition", condition);
	   map.put("keyword", keyword);
	   
	   //페이징처리(키워드가 포함된 글의 개수)
	   PageInfo pi = Pagination.getPageInfo(adminService.selectMemberSearchCount(map), currentPage, 5, 10);
     
	  ArrayList<Member> memList =  adminService.selectMemberSearchList(map,pi);
	  // System.out.println(memList);
	   
	   
	   //페이징 처리된 결과ArrayList
	   mv.addObject("searchList",memList); //list결과->key값 searchList
	   mv.addObject("pi",pi);
	   mv.addObject("keyword", keyword);
	   mv.addObject("condition", condition);
	   mv.setViewName("admin/adminMemberSearch");
	   
	   
	   
      //검색 결과가 없을땐 조회된 결과가 없습니다. 뿌려주기
      
      //검색한 키워드 검색창에 그대로 
      return mv;
   }
	
	
}
