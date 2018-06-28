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
	
	@Test
	public void testCRUDProduct() {
		
		// create operations
		product = new Product();
		
		product.setName("Quicksilver 'Play' Snow Helmet");
		product.setBrand("Quicksilver");
		product.setDescription("Be safe on the slops with the new Quicksilver snowboarding helmet!");
		product.setUnitPrice(100);
		product.setActive(true);
		product.setCategoryId(6);
		product.setSupplierId(2);
		product.setQuantity(0);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		
/*		// create operations
		product = new Product();
		
		product.setName("Burton Process Flying V");
		product.setBrand("Burton");
		product.setDescription("One of the best boards from Burton");
		product.setUnitPrice(500);
		product.setActive(true);
		product.setCategoryId(1);
		product.setSupplierId(1);
		product.setQuantity(10);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// create operations
		product = new Product();
		
		product.setName("Rome Mountain Division");
		product.setBrand("Rome");
		product.setDescription("Beast of a board. Ride the buck, be the buck!");
		product.setUnitPrice(650);
		product.setActive(true);
		product.setCategoryId(1);
		product.setSupplierId(2);
		product.setQuantity(5);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// create operations
		product = new Product();
		
		product.setName("Rossignol Distrikt 2019");
		product.setBrand("Rossignol");
		product.setDescription("Rossignol description");
		product.setUnitPrice(300);
		product.setActive(true);
		product.setCategoryId(1);
		product.setSupplierId(3);
		product.setQuantity(5);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// create operations
		product = new Product();
		
		product.setName("Dragon NFX2");
		product.setBrand("Dragon");
		product.setDescription("Dragon description");
		product.setUnitPrice(170);
		product.setActive(true);
		product.setCategoryId(5);
		product.setSupplierId(3);
		product.setQuantity(8);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// create operations
		product = new Product();
		
		product.setName("Union Force");
		product.setBrand("Union");
		product.setDescription("Union description");
		product.setUnitPrice(250);
		product.setActive(true);
		product.setCategoryId(2);
		product.setSupplierId(2);
		product.setQuantity(15);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		// create operations
		product = new Product();
		
		product.setName("Burton Ion Boa");
		product.setBrand("Burton");
		product.setDescription("Burton Ion Boa description");
		product.setUnitPrice(300);
		product.setActive(true);
		product.setCategoryId(3);
		product.setSupplierId(1);
		product.setQuantity(6);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));*/
		
//		// readding and updating the category
//		product = productDAO.get(2);
//		product.setName("Rome Mountain Division 2018");
//		
//		assertEquals("Something went wrong while updating the existing record!", true, productDAO.update(product));
//		
//		assertEquals("Something went wrong while deleting the existing record!", true, productDAO.delete(product));
//		
//		// list
//		assertEquals("Something went wrong while fetching the list of products!", 6, productDAO.list().size());
	}
	
/*	@Test
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
	*/
	
	

}
