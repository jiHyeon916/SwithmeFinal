package com.kh.swithme.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 이유진
	@RequestMapping("adPage.ad")
	public String adminPageMain() {
		return "admin/adminPageMain";
	}
	
	@RequestMapping("itemList.ad")
	public String adminItemListView() {
		return "admin/itemManagement";
	}
	
	
}
