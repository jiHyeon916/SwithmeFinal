package com.kh.swithme.band.model.vo;

import lombok.Data;

@Data
public class BandReport {

	private int reportNo; // REPORT_NO
	private String reportMemberId; // REPORT_MEMBER_ID
	private int totalNo; // TOTAL_NO
	private String reportCategory; // REPORT_CATEGORY
	private String reportDate; // REPORT_DATE
	private String reportStatus; // REPORT_STATUS
	private String reportReason; // REPORT_REASON
	private String reportContent; // REPORT_CONTENT
}
