package com.kh.swithme.board.model.vo;

import lombok.Data;

@Data
public class Board {

	private int boardNo; 
	private String memberId;
	private String boardType;
	
	private String category;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String status;
	private int count;
	private int likeCount;
	private int likeStatus;
	private int bookStatus;
	private int commentCount;
	private String summary;
	
	private String tagList;
	private int tagCount;
	
	private String key;
	private String keyType;
	
}