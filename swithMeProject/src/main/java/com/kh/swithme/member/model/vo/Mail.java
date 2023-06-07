package com.kh.swithme.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Mail {

	private String  who, secret, when;
	
	//@AllArgsConstructor => 기본생성자 호출 / 모든생성자를 파라미터로 받음
}
