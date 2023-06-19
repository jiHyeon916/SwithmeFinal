package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class BandMember {

	private int sbNo; // SB_NO	NUMBER
	private String memberId; // MEMBER_ID	VARCHAR2(20 BYTE) 닉네임
	private String banish; // BANISH	CHAR(1 BYTE)
	private String sort;
	private String memId; // 아이디
	private String key;
}
