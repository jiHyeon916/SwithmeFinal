package com.kh.swithme.admin.model.vo;

import lombok.Data;

@Data
public class QNAReply {
	private int qnaReplyNo; //QNA_REPLY_NO	NUMBER
	private int qnaNo; //QNA_NO	NUMBER
	private String qnaReplyContent; //QNA_REPLY_CONTENT	VARCHAR2(2000 BYTE)
	private String qnaReplyCreateDate; //QNA_REPLY_CREATE_DATE	DATE
}
