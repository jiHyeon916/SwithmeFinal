package com.kh.swithme.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Calendar {
	
	private int calendarNo;
	private String memberId;
	private String startDay;
	private String endDay;
	private String calendarTitle;
	private String calendarContent;
	private String textColor;
	private String backgroundColor;
	
}
