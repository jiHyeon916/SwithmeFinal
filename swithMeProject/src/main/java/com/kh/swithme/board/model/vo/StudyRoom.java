package com.kh.swithme.board.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class StudyRoom {
	private int studyRoomNo;
	private String studyRoomName;
	private String studyRoomLocation;
	private String studyRoomAddress;
	private float studyRoomLat;
	private float studyRoomLng;
	private String studyRoomPhone;
	private String studyRoomIntroduce;
	private Date studyRoomCreatedate;
	private String studyRoomWebsite;
}
