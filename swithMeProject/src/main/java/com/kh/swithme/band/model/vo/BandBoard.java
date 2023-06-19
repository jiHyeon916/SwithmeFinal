package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class BandBoard {
	
	private int sbNo; // SB_NO	NUMBER
	private int sbBoardNo; // SB_BOARD_NO	NUMBER
	private String memberId; // NICKNAME	VARCHAR2(20 BYTE)
	private String sbCategory; // SB_CATEGORY	CHAR(1 BYTE)
	private String sbContent; // SB_CONTENT	VARCHAR2(1000 BYTE)
	private String sbCreateDate; // SB_CREATE_DATE	DATE
	private String sbStatus; // SB_STATUS	CHAR(1 BYTE)
	private String sbCount; // SB_COUNT	NUMBER
	private String changeName; 
	private String count;
	private String keyword; // 검색 키워드
	private String memId; // memberId
}
