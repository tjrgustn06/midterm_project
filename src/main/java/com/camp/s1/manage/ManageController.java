package com.camp.s1.manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manage/*")
public class ManageController {
	
	@GetMapping("index")
	public void getIndexpage() throws Exception {
		
	}

}
