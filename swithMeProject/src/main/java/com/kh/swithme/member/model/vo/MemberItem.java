package com.kh.swithme.member.model.vo;

import lombok.Data;

@Data
public class MemberItem {
	private int itemNo; //ITEM_NO	NUMBER
	private String memberId; //MEMBER_ID	VARCHAR2(20 BYTE)
	private String wearStatus; //WEAR_STATUS	CHAR(1 BYTE)
	
	private String itemCategory;
}
