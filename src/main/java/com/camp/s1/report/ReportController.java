package com.camp.s1.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.util.Pager;

@RequestMapping("**/report/*")
@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	
	
	@GetMapping("report")
	public ModelAndView setReportAdd(ReportDTO reportDTO, @RequestParam(name = "commentNum", required = false) Long commentNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("report/report");
		mv.addObject("dto", reportDTO);
		mv.addObject("commentNum", commentNum);
		return mv ;
	}
	
	@PostMapping("report")
	public ModelAndView setReportAdd(ReportDTO reportDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
			
		int result = reportService.setReportAdd(reportDTO);
		
		String msg = "신고가 정상적으로 신청되지 못했습니다";
		
		if(result == 1) {
			msg = "신고 신청이 완료되었습니다. 검토 후 처리될 예정입니다";
		}
		else if(result == 2) {
			msg = "같은 글에 대해 중복 신고는 허용하지 않습니다";
		}
		
		mv.setViewName("common/result");
		
		
		mv.addObject("result", msg);
		mv.addObject("url", "/");
		return mv ;
	}
	
	@GetMapping("list")
	public ModelAndView getReportList(ReportDTO reportDTO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/manage/reportList");
		mv.addObject("list", reportService.getReportList(pager));
		mv.addObject("pager", pager);
		
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getReportDetail(ReportDTO reportDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/manage/detail");
		mv.addObject("dto", reportService.getReportDetail(reportDTO));
		
		return mv;
	}
	
	@PostMapping("result")
	public ModelAndView setReportResult(ReportDTO reportDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = reportService.setReportResult(reportDTO);
		
		String msg = "처리 실패";
		
		if(result > 0) {
			msg = "신고 처리가 정상적으로 완료되었습니다";
		}
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
}
