package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class BandAlarm {
	private String alarmNo; // ALARM_NO
	private int alarmSbNo; // ALARM_SB_NO
	private String alarmMember; // ALARM_MEMBER
	private String alarmCategory; // ALARM_CATEGORY
	private String alarmDate; // ALARM_DATE
	private String alarmStatus; //ALARM_STATUS
}
