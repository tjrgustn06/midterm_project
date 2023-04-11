package com.camp.s1.report;

import java.sql.Date;

import com.camp.s1.board.BoardDTO;


public class ReportDTO {
	private Long reportNum;
	private Long num;
	private Long commentNum;
	private Long boardId;
	private Long reportResult;
	private String reporter;
	private String reportedUser;
	private String reportContents;
	private String reportedContents;
	private Date reportDate;
	
	private BoardDTO boardDTO;
	
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
	public Long getReportResult() {
		return reportResult;
	}
	public void setReportResult(Long reportResult) {
		this.reportResult = reportResult;
	}
	public String getReportedUser() {
		return reportedUser;
	}
	public void setReportedUser(String reportedUser) {
		this.reportedUser = reportedUser;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public BoardDTO getBoardDTO() {
		return boardDTO;
	}
	public void setBoardDTO(BoardDTO boardDTO) {
		this.boardDTO = boardDTO;
	}
	public String getReportedContents() {
		return reportedContents;
	}
	public void setReportedContents(String reportedContents) {
		this.reportedContents = reportedContents;
	}
	

	
	
	
}
