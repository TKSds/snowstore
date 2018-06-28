package com.ds.snowstore.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ds.snowstore.exception.ProductNotFoundException;
import com.ds.storebackend.dao.CategoryDAO;
import com.ds.storebackend.dao.ProductDAO;
import com.ds.storebackend.dto.Category;
import com.ds.storebackend.dto.Product;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value= {"/", "/home", "/index"}, method=RequestMethod.GET)
	public String index(Model model) {
		
		model.addAttribute("title", "Home");
		
		logger.info("Inside PageController index method! - INFO");
		logger.debug("Inside PageController index method! - DEBUG");
		
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
	
	// Viewing a single product
	
	@RequestMapping(value= {"/show/{id}/product"}, method = RequestMethod.GET)
	public String showSingleProduct(Model model, @PathVariable("id") int id) throws ProductNotFoundException {
		
	    Product product = productDAO.get(id);
	    
	    // If product is unavailable ProductNotFoundException will be thrown
	    if (product == null) throw new ProductNotFoundException();
	    
	    // update the view count
	    product.setViews(product.getViews() + 1);
	    productDAO.update(product);
	    
	    model.addAttribute("title", product.getName());
	    model.addAttribute("product", product);
	    
	    model.addAttribute("userClickShowProduct", true);
		
		return "page";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
