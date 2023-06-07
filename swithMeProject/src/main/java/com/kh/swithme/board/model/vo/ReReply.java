package com.kh.swithme.board.model.vo;

import lombok.Data;

@Data
public class ReReply {
	private int reReplyNo; //BOARD_RE_REPLY_NO
	private int replyNo; //BOARD_REPLY_NO
	private String memberId; //MEMBER_ID
	private String reReplyContent; //OARD_REPLY2_CONTENT
	private String createDate; //BOARD_REPLY2_CREATE_DATE
	private String reReplyFile; //BOARD_REPLY2_FILE
	private String status; //STATUS
	
}
