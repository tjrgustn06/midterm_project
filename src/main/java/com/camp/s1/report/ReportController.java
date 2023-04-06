package com.camp.s1.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.board.BbsDTO;

@RequestMapping("/report/*")
@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@GetMapping("report")
	public ModelAndView setReportAdd(BbsDTO bbsDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("/report/report");
		mv.addObject("num", bbsDTO.getNum());
		return mv ;
	}
	
	@PostMapping("report")
	public ModelAndView setReportAdd(ReportDTO reportDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = reportService.setReportAdd(reportDTO);
		
		String msg = "신고 실패";
		
		if(result > 0) {
			msg = "신고 신청이 완료되었습니다. 검토 후 처리될 예정입니다";
		}
		
		mv.setViewName("common/result");
		
		
		mv.addObject("result", msg);
		mv.addObject("url", "redirect:./list");
		return mv ;
	}
}
