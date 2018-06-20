package com.ds.snowstore.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	
	@RequestMapping(value= {"/", "/home", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("title", "Home");
		model.addAttribute("userClickHome", true);
		return "page";
	}
	
	@RequestMapping(value="/about", method=RequestMethod.GET)
	public String aboutus(Model model) {
		
		model.addAttribute("title", "About Us");
		model.addAttribute("userClickAbout", true);
		
		return "page";
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public String contact(Model model) {
		
		model.addAttribute("title", "Contact Us");
		model.addAttribute("userClickContact", true);
		
		return "page";
	}

}
