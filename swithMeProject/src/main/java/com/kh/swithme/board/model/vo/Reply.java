package com.kh.swithme.board.model.vo;

import lombok.Data;

@Data
public class Reply {
	private int boardReplyNo; //BOARD_REPLY_NO
	private int boardNo; //BOARD_NO
	private String memberId; //MMEMBER_ID
	private String boardReplyContent; //BOARD_REPLY_CONTENT
	private String boardReplyFile; //BOARD_REPLY_FILE
	private String createDate; //BOARD_REPLY_CREATE_DATE
	private String status; //BOARD_STATUS
}