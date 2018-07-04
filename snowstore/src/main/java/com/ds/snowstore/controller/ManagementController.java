package com.ds.snowstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ds.snowstore.util.FileUploadUtility;
import com.ds.snowstore.validator.ProductValidator;
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
				model.addAttribute("message", "Product Submited Successfully!");
			}
			else if(operation.equals("category")) {
				model.addAttribute("message", "Category Submited Successfully!");
			}
		}

		return "page";
	}
	
	// handling product submission
	
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, Model model, HttpServletRequest request) {
		
		// handle image validation for new products
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		} else {
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}
		}
		
		
		
		// check if there any errors
		if (results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			
			model.addAttribute("message", "Validation Failed For Product Submission!");
			
			return "page";
		}
		
        logger.info(mProduct.toString());
		
        if (mProduct.getId() == 0) {
        	// create a new product record if id = 0
        	productDAO.add(mProduct);
        } else {
        	// update product if id is not 0
        	productDAO.update(mProduct);
        }
		
		
		
		if (!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode());
		}
		
		return "redirect:/manage/products?operation=product";
	}
	
	// handle product activation
	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {
		
		// fetch product by id form the database
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		
		// activating and deactivating based on the value of the active field
		product.setActive(!product.isActive());
		
		// updating the product
		productDAO.update(product);
		
		
		return (isActive) ? "You have successfully deactivated the product with id " + product.getId() :
			                "You have successfully activated the product with id " + product.getId();
	}
	
	// show edit product
	
	@RequestMapping(value = "/{id}/product", method=RequestMethod.GET)
	public String showEditProduct(@PathVariable int id, Model model) {
		
		model.addAttribute("userClickManageProducts", true);
		model.addAttribute("title", "Manage Products");
		
		// fetch the product from the database
		Product nProduct = productDAO.get(id);
		
		// set the product fetched from the database
		model.addAttribute("product", nProduct);
		
		return "page";
	}
	
	// to handle category submission / new category
	
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		
		// add new category
		categoryDAO.add(category);
		
		return "redirect:/manage/products?operation=category";
	}
	


	// returning categories for all the request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {

		return categoryDAO.list();

	}
	
	
	@ModelAttribute("category")
	public Category getCategory() {
		
		return new Category();
		
	}
	
	
	
}
