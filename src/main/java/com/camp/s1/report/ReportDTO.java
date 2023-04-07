package com.camp.s1.report;

public class ReportDTO {
	private Long reportNum;
	private Long num;
	private Long commentNum;
	private Long boardId;
	private String reporter;
	private String reportContents;
	
	public Long getReportNum() {
		return reportNum;
	}
	public void setReportNum(Long reportNum) {
		this.reportNum = reportNum;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	
	public Long getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(Long commentNum) {
		this.commentNum = commentNum;
	}
	public Long getBoardId() {
		return boardId;
	}
	public void setBoardId(Long boardId) {
		this.boardId = boardId;
	}
	
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getReportContents() {
		return reportContents;
	}
	public void setReportContents(String reportContents) {
		this.reportContents = reportContents;
	}
	
	
}
