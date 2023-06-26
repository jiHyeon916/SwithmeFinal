package com.kh.swithme.board.model.vo;

import lombok.Data;

@Data
public class Board {

	private int boardNo;  //보드 넘버 
	private String memberId; // 멤버 아이디 , 닉네임 
	private String boardType; // 보드 타입 프리, 인포 
	private String category; // 카테고리 
	private String boardTitle; // 글 제목 
	private String boardContent;  // 컨텐츠 내용 
	private String createDate;  // 작성일  
	private String status;  // 게시물 상태  
	private int count;  // 조회수 
	private int likeCount;  // 좋아요 수 
	private int likeStatus;  // 좋아요 상태 
	private int bookStatus;  // 북마크 수 
	private int commentCount;  // 댓글 수 
	private String summary;  // 글 요약 
	private String tagList;  // 태그리스트 
	private int tagCount;  // 태그 수 
	private String key;  // 검색 키워드 
	private String keyType;  //키워드 타입 => 태그 또는 검색 
	private int totalPerson; // 총 모집 인원 수 
	private String prev;
	private int prevNo;
	private String next;
	private int nextNo;
	
}