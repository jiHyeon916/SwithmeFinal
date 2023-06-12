package com.kh.swithme.member.model.vo;

import lombok.Data;

@Data
public class QNA {

	private int qnaNo;
	private String memberId;
	private String qnaTitle; 
	private String qnaContent;
	private String qnaDate; 
	private String qnaStatus;
	
}
