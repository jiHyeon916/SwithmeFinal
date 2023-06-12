package com.kh.swithme.member.model.vo;

import lombok.Data;

@Data
public class Alarm {
	
	private String alarmNo;
	private String alarmMemberId;
	private int alarmBoardNo; // 게시글번호 또는 밴드번호
	private String alarmCategory;
	private String alarmDate;
	private String alarmStatus;
	
	private String alarmSort; // 게시판알림 or 밴드알림 구분
	
	
}
