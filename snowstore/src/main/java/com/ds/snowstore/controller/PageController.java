package com.ds.snowstore.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	
	@RequestMapping(value= {"/", "/home", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("greeting", "Welcome to the Snow Store!");
		return "page";
	}
	

}
