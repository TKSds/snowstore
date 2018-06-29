package com.ds.snowstore.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ds.storebackend.dao.CategoryDAO;
import com.ds.storebackend.dao.ProductDAO;
import com.ds.storebackend.dto.Category;
import com.ds.storebackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String showManageProducts(Model model, @RequestParam(name="operation", required=false) String operation) {

		model.addAttribute("userClickManageProducts", true);

		model.addAttribute("title", "Manage Products");

		Product nProduct = new Product();

		// set a few of the fields
		nProduct.setSupplierId(1);
		nProduct.setActive(true);

		model.addAttribute("product", nProduct);
		
		if (operation != null) {
			
			if (operation.equals("product")) {
				model.addAttribute("message", "Product Submited successfully!");
			}
		}

		return "page";
	}
	
	// handling product submission
	
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@ModelAttribute("product") Product mProduct) {
		
        logger.info(mProduct.toString());
		
		// create a new product record
		productDAO.add(mProduct);
		
		return "redirect:/manage/products?operation=product";
	}


	// returning categories for all the request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {

		return categoryDAO.list();

	}
	
}
