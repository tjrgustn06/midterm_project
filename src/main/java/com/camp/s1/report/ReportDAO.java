package com.camp.s1.report;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.board.BoardTypeDTO;
import com.camp.s1.util.Pager;

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
	
	public List<ReportDTO> getReporterList(ReportDTO reportDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReporterList", reportDTO);
	}
	
	public List<ReportDTO> getReportList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getReportList", pager);
	}
	
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}
	
	public int setReportResult(ReportDTO reportDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setReportResult", reportDTO);
	}
	
	
	
	
	
}
