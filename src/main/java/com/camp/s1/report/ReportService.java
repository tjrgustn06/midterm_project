package com.camp.s1.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO reportDAO;
	
	public int setReportAdd(ReportDTO reportDTO) throws Exception {
		
		int result = 0;
		
		if(reportDTO.getBoardId() % 2 != 0) {
			List<ReportDTO> ar = reportDAO.getReportList(reportDTO);
			for (ReportDTO reportDTO2 : ar) {
				if(reportDTO2.getReporter().equals(reportDTO.getReporter())) {
					result = 2;
					return result;
				}
				
			}
			return reportDAO.setReportAdd(reportDTO);
		} 
		else {
			return reportDAO.setCommentReportAdd(reportDTO);
		}
	
	}
}
