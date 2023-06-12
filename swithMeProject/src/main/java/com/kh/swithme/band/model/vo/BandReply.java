package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class BandReply {
	
	private int sbReplyNo; //  SB_REPLY_NO	NUMBER
	private int sbBoardNo; // SB_BOARD_NO	NUMBER
	private String memberId; // MEMBER_ID	VARCHAR2(20 BYTE)
	private String sbReplyContent; // SB_REPLY_CONTENT	VARCHAR2(500 BYTE)
	private String sbDate; // SB_DATE	DATE
	private String replyStatus; // REPLY_STATUS	CHAR(1 BYTE)

}
