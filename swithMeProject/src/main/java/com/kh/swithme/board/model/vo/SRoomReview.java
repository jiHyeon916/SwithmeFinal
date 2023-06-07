package com.kh.swithme.board.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class SRoomReview {
	private int reviewNo;
	private int studyRoomNo;
	private String memberId;
	private String reviewContent;
	private int reviewStar;
	private Date reviewDate;

}
