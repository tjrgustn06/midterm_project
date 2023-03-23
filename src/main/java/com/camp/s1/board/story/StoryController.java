package com.camp.s1.board.story;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/story/*")
public class StoryController {

	@Autowired
	private StoryService storyService;
	
	
}
