package com.kh.swithme.admin.model.vo;

import lombok.Data;

@Data
public class Item {
	private int itemNo; // 아이템번호
	private String itemCategory; // 카테고리 : 배경, 캐릭터, 모자, 도구
	private String itemName; // 아이템이름
	private String itemContent; // 아이템설명
	private int itemPrice;  // 아이템 가격
	private String itemStatus;  // 아이템 판매상태 : Y 판매중 / N 판매중단
	private String itemPhoto; // 아이템사진명
}
