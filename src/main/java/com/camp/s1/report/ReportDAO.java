package com.camp.s1.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.camp.s1.report.reportDAO.";
	
	public int setReportAdd(ReportDTO reportDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setReportAdd", reportDTO);
	}
	
	
}
