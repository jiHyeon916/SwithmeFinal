package com.kh.swithme.member.model.vo;

import lombok.Data;

@Data
public class TodoList {
	private int todoNo;
	private String memberId;
	private String todoDate;
	private String todoContent;
	private String todoStatus;
}
