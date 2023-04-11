package com.camp.s1.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.board.BoardTypeDTO;
import com.camp.s1.util.Pager;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO reportDAO;
	
	public int setReportAdd(ReportDTO reportDTO) throws Exception {
		
		int result = 0;
		
		if(reportDTO.getCommentNum() == null) {
			List<ReportDTO> ar = reportDAO.getReporterList(reportDTO);
			for (ReportDTO reportDTO2 : ar) {
				if(reportDTO2.getReporter().equals(reportDTO.getReporter())) {
					result = 2;
					return result;
				}
				
			}
			return reportDAO.setReportAdd(reportDTO);
		} 
		else {
			List<ReportDTO> ar = reportDAO.getReporterList(reportDTO);
			for (ReportDTO reportDTO2 : ar) {
				if(reportDTO2.getReporter().equals(reportDTO.getReporter())) {
					result = 2;
					return result;
				}
				
			}
			return reportDAO.setCommentReportAdd(reportDTO);
		}
	
	}
	
	public List<ReportDTO> getReportList(Pager pager) throws Exception {
		
		pager.makeNum(reportDAO.getTotalCount(pager));
		
		pager.makeRow();
		
		return reportDAO.getReportList(pager);
	}
	
	public int setReportResult(ReportDTO reportDTO) throws Exception {
		int result = reportDAO.setReportResult(reportDTO);

		if(reportDTO.getReportResult() == 3) {
			// 신고승인된 게시물 컨텐츠에 대해 블라인드 필요
		}
		
		
		
		return result;
	}
}
