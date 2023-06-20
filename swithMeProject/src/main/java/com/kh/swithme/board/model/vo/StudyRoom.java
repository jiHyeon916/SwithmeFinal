package com.kh.swithme.board.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class StudyRoom {
	private int studyRoomNo;
	private String studyRoomName;
	private String studyRoomLocation;
	private String studyRoomAddress;
	private String studyRoomLat;
	private String studyRoomLng;
	private String studyRoomPhone;
	private String studyRoomIntroduce;
	private Date studyRoomCreatedate;
	private String studyRoomWebsite;
	private String titleImg;
	
}
