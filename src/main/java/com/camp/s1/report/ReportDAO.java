package com.camp.s1.report;

import java.util.List;

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
	
	public int setCommentReportAdd(ReportDTO reportDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setCommentReportAdd", reportDTO);
	}
	
	public ReportDTO getParentNum(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getParentNum", reportDTO);
	}
	
	public List<ReportDTO> getReportList(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReportList", reportDTO);
	}
	
	
}
