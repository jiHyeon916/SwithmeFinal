package com.kh.swithme.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.swithme.admin.model.service.AdminService;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;

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
	  mv.addObject("memList", adminService.adminMemberList(pi));
	  mv.setViewName("admin/adminMember");
	  return mv; 
	   

   }
   
   
   @RequestMapping("adminMemberSearch.ad")
   public String adminMemberSearch(int currentPage, String keyword, String condition) {
      
      //페이징처리
      
      // 키워드값
      
      //옵션 다 받기 
      
      //검색 결과가 없을땐 조회된 결과가 없습니다. 뿌려주기
      
      //검색한 키워드 검색창에 그대로 
      return "admin/adminMemberSearch";
   }
	
	
}
