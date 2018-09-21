package com.ds.snowstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cart") // req mapping at class level due to the fact that only USERS will have access to this controller
public class CartController {
	
	@RequestMapping(value = "/show", method=RequestMethod.GET)
	public String showCart(Model model) {
		
		model.addAttribute("title", "User Cart");
		model.addAttribute("userClickShowCart", true);
		model.addAttribute("cartLines", null);
		
		return "page";
	}

}
