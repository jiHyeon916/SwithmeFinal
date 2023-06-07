package com.kh.swithme.board.model.vo;

import lombok.Data;

@Data
public class Attach {
	private int fileNo;
	private String originName;
	private String changeName;
	private int fileLevel; // 1:썸네일(대표이미지)
	private int refNo; 
	private int field; // 1.게시판 2.스터디룸 3.스터디밴드
}
