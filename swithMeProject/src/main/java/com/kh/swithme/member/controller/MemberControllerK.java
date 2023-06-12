package com.kh.swithme.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.swithme.member.model.service.MemberService;
import com.kh.swithme.member.model.vo.Calendar;
import com.kh.swithme.member.model.vo.TodoList;

@Controller
public class MemberControllerK {
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="calendar.me")
	public String myCalendar() {
		return "member/myPageCalendar";
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="selectTodoList", produces="application/json; charset=UTF-8")
	public String selectTodoList(TodoList td) {
		return new Gson().toJson(memberService.selectTodoList(td));
	}
	
	@ResponseBody
	@RequestMapping(value="todoCalendarList.me", produces="application/json; charset=UTF-8")
	public String todoCalendarList()
	
	@ResponseBody
	@RequestMapping(value="insertTodoList")
	public int insertTodoList(TodoList td) {
		return memberService.insertTodoList(td);
	}
	
	@ResponseBody
	@RequestMapping(value="checkTodoList.me")
	public int checkTodoList(int todoNo) {
		return memberService.checkTodoList(todoNo);
	}
	
	@ResponseBody
	@RequestMapping(value="uncheckTodoList.me")
	public int uncheckTodoList(int todoNo) {
		return memberService.uncheckTodoList(todoNo);
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("studyBand.me")
	public String myStudyBandList() {
		return "member/myStudyBand";
	}
	
}
