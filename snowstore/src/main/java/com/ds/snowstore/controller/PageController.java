package com.ds.snowstore.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ds.storebackend.dao.CategoryDAO;
import com.ds.storebackend.dto.Category;

@Controller
public class PageController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping(value= {"/", "/home", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("title", "Home");
		
		//passing the list of categories
		model.addAttribute("categories", categoryDAO.list());
		
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
	
	/*
	 * Methods to load all the products and based on category
	 */
	
	@RequestMapping(value= "/show/all/products", method=RequestMethod.GET)
	public String showAllProducts(Model model) {
		
		model.addAttribute("title", "All Products");
		
		//passing the list of categories
		model.addAttribute("categories", categoryDAO.list());
		
		model.addAttribute("userClickAllProducts", true);
		return "page";
	}
	
	@RequestMapping(value= {"/show/category/{id}/products"}, method=RequestMethod.GET)
	public String showCategoryProducts(Model model, @PathVariable("id") int id) {
		
		// categodyDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		
		model.addAttribute("title", category.getName());
		
		// passing the list of categories
		model.addAttribute("categories", categoryDAO.list());
		
		// passing a single category object
		model.addAttribute("category", category);
		
		model.addAttribute("userClickCategoryProducts", true);
		
		return "page";
	}

}
