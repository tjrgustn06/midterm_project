package com.camp.s1.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO reportDAO;
	
	public int setReportAdd(ReportDTO reportDTO) throws Exception {
		return reportDAO.setReportAdd(reportDTO);
	}
}
