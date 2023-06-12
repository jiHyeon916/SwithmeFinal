package com.kh.swithme.member.model.vo;

import lombok.Data;

@Data
public class Point {
	
	private String memberId;
	private int pointScore;
	private String pointDetail;
	private String pointStatus;
	private String pointTime;
	
	private int totalPoint; // 총 포인트

}
