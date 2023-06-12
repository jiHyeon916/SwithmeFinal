package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class Band {
	
	private int sbNo; // SB_NO	NUMBER
	private String memberId; // MEMBER_ID	VARCHAR2(20 BYTE)
	private String sbTitle; // SB_TITLE	VARCHAR2(50 BYTE)
	private String sbIntroduce; // SB_INTRODUCE	VARCHAR2(1000 BYTE)
	private String sbChangeName; //SB_CHANGE_NAME	VARCHAR2(500 BYTE)
	private int sbRecruitMem; //SB_RECRUIT_MEM	NUMBER
	private int sbNowMem; // SB_NOW_MEM	NUMBER
	private String sbStatus; // SB_STATUS	CHAR(1 BYTE)
	private String sbCategory;
	private String createDate;

}
