package com.kh.swithme.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.service.MemberService;
import com.kh.swithme.member.model.vo.BandBookMark;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.TodoList;

@Controller
public class MemberControllerK {
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="calendar.me")
	public String myCalendar() {
		return "member/myPageCalendar";
	}
	
	//캘린더
		@ResponseBody
		@RequestMapping(value="calendarList.me", produces="application/json; charset=UTF-8")
		public String ajaxMyCalenerList(String memberId) {
			//System.out.println(memberId);
			ArrayList<Calendar> list = memberService.selectMyCalendarlList(memberId);
			return new Gson().toJson(list);
		}
		
		@ResponseBody
		@RequestMapping(value="addSchedule.me")
		public int ajaxAddSchedule(Calendar cl) {
			return memberService.addSchedule(cl);
		}
		
		@ResponseBody
		@RequestMapping(value="deleteSchedule.me")
		public int ajaxDeleteSchedule(Calendar cl) {
			return memberService.deleteSchedule(cl);
		}
		
		@ResponseBody
		@RequestMapping(value="updateSchedule.me")
		public int ajaxUpdateSchedule(Calendar cl) {
			return memberService.updateSchedule(cl);
		}
		
		//투두리스트
		@RequestMapping("toDoList.me")
		public String toDoListMain() {
			return "member/myPageToDoList";
		}
		
		//투두리스트 조회
		@ResponseBody
		@RequestMapping(value="selectTodoList.me", produces="application/json; charset=UTF-8")
		public HashMap<String, Object> selectTodoList(TodoList td) {
			HashMap<String, Object> data = new HashMap<>();
			data.put("all", memberService.selectTodoListAll(td));
			data.put("todo", memberService.selectTodoListTodo(td));
			data.put("complete", memberService.selectTodoListComplete(td));
			return data;
		}
		
		// 투두리스트 달력 색 가져오기
		@ResponseBody
		@RequestMapping(value="todoAchievementRate.me", produces="application/json; charset=UTF-8")
		public String todoAchievementRateList(String memberId) {
			return new Gson().toJson(memberService.todoAchievementRateList(memberId));
		}
		
		// 투두리스트 추가
		@ResponseBody
		@RequestMapping(value="insertTodoList")
		public HashMap<String, Object> insertTodoList(TodoList td) {
			HashMap<String, Object> data = new HashMap<>();
			data.put("insert", memberService.insertTodoList(td));
			data.put("todoList", memberService.selectTodoListAll(td));
			return data;
		}
		
		//투두리스트 할일 완
		@ResponseBody
		@RequestMapping(value="checkTodoList.me")
		public HashMap<String, Object> checkTodoList(TodoList td) {
			HashMap<String, Object> data = new HashMap<>();
			data.put("update", memberService.checkTodoList(td.getTodoNo()));
			data.put("todoList", memberService.selectTodoListAll(td));
			return data;
		}
		
		// 투두리스트 할일 못함
		@ResponseBody
		@RequestMapping(value="uncheckTodoList.me")
		public HashMap<String, Object> uncheckTodoList(TodoList td) {
			HashMap<String, Object> data = new HashMap<>();
			data.put("update", memberService.uncheckTodoList(td.getTodoNo()));
			data.put("todoList", memberService.selectTodoListAll(td));
			return data;
		}
		
		//투두리스트 삭제
		@ResponseBody
		@RequestMapping(value="deleteTodo.me")
		public HashMap<String, Object> deleteTask(TodoList td) {
			HashMap<String, Object> data = new HashMap<>();
			data.put("delete", memberService.deleteTask(td));
			data.put("todoList", memberService.selectTodoListAll(td));
			return data;
		}
		

		// 스터디밴드 북마크
		@RequestMapping("studyBand.me")
		public String myStudyBand() {
			return "member/myStudyBand";
		}
		
		// 스터디밴드 북마크 조회
		@ResponseBody
		@RequestMapping(value="allStudyBandList.me", produces="application/json; charset=UTF-8")
		public String allStudyBandList(String memberId) {
			return new Gson().toJson(memberService.allStudyBandList(memberId));
		}
		
		// 즐겨찾는 스터디밴드 조회
		@ResponseBody
		@RequestMapping(value="favoriteStudyBandList.me", produces="application/json; charset=UTF-8")
		public String favoriteStudyBand(String memberId) {
			return new Gson().toJson(memberService.favoriteStudyBand(memberId));
		}
		
		@ResponseBody
		@RequestMapping(value="selectSbandBookmark.me")
		public int selectSbandBookmark(BandBookMark bm) {
			return memberService.selectSbandBookmark(bm);
		}
		
		// 스터디밴드 북마크 추가
		@ResponseBody
		@RequestMapping(value="insertSbandBookmark.me")
		public int insertSbandBookmark(BandBookMark bm) {
			return memberService.insertSbandBookmark(bm);
		}
		
		//스터디밴드 북마크 삭제
		@ResponseBody
		@RequestMapping(value="deleteSbandBookmark.me")
		public int deleteSbandBookmark(BandBookMark bm) {
			return memberService.deleteSbandBookmark(bm);
		}
		
		// 마이페이지 - 북마크 전체 조회
		@RequestMapping("bookmark.me")
		public String myBookMarkListView(@RequestParam(value="cPage", defaultValue="1") int currentPage, 
										HttpSession session, Model model) {
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			PageInfo pi = Pagination.getPageInfo(memberService.selectBookMarkListCount(memberId), currentPage, 10, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", memberService.selectBoardBookMarkList(memberId, pi));
			return "member/myBookMark";
		}
		// 북마크 삭제
		
		@ResponseBody
		@RequestMapping("deleteBookMark.me")
		public int deleteBoardBookMark(@RequestParam(value="boardNo[]")int[] boardNo, String memberId) {
			int result=1;
			for(int i=0; i<boardNo.length; i++) {
				result = memberService.deleteBoardBookMark(boardNo[i]);
			}
			return result;
		}
		
	
	
}
