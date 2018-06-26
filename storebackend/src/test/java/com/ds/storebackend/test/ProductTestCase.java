package com.ds.storebackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ds.storebackend.dao.ProductDAO;
import com.ds.storebackend.dto.Product;

public class ProductTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static ProductDAO productDAO;
	
	private Product product;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.ds.storebackend");
		context.refresh();
		
		productDAO = (ProductDAO) context.getBean("productDAO");
	}
	
/*	@Test
	public void testCRUDProduct() {
		
		// create operation
		product = new Product();
		
		product.setName("Rossignol Distrikt 2019");
		product.setBrand("Rossignol");
		product.setDescription("Rossignol description");
		product.setUnitPrice(300);
		product.setActive(true);
		product.setCategoryId(1);
		product.setSupplierId(3);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// readding and updating the category
		product = productDAO.get(2);
		product.setName("Rome Mountain Division 2018");
		
		assertEquals("Something went wrong while updating the existing record!", true, productDAO.update(product));
		
		assertEquals("Something went wrong while deleting the existing record!", true, productDAO.delete(product));
		
		// list
		assertEquals("Something went wrong while fetching the list of products!", 6, productDAO.list().size());
	}*/
	
	@Test
	public void testListActiveProducts() {
		assertEquals("Something went wrong while fetching the active list of products!", 5, productDAO.listActiveProducts().size());
		
	}
	
	@Test
	public void testListActiveProductsByCategory() {
		assertEquals("Something went wrong while fetching the active lits of products by category!", 2, productDAO.listActiveProductsByCategory(1).size());
		
		assertEquals("Something went wrong while fetching the active lits of products by category!", 1, productDAO.listActiveProductsByCategory(2).size());
		
		assertEquals("Something went wrong while fetching the active lits of products by category!", 1, productDAO.listActiveProductsByCategory(3).size());

		assertEquals("Something went wrong while fetching the active lits of products by category!", 1, productDAO.listActiveProductsByCategory(5).size());
	}
	
	@Test
	public void testGetLatestActiveProduct() {
		assertEquals("Something went wrong while fetching the latest active products!", 5, productDAO.getLatestActiveProducts(6).size());
		
	}
	
	
	

}
