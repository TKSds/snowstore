package com.ds.storebackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ds.storebackend.dao.CategoryDAO;
import com.ds.storebackend.dto.Category;

public class CategoryTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static CategoryDAO categoryDAO;
	
	private Category category;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("com.ds.storebackend");
		context.refresh();
		
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}
	
//	@Test
//	public void testAddCategory() {
//		
//		category = new Category();
//		
//		category.setName("ROME");
//		category.setDescription("description data for ROME");
//		category.setImageURL("CAT_101.png");
//		
//		assertEquals("Successfully added a category inside the table!", true, categoryDAO.add(category));
//		
//	}
	
//	@Test
//	public void testGetCategory() {
//		
//		category = categoryDAO.get(3);
//		
//		assertEquals("Successfully fetched a single category from the table!", "ROME", category.getName());
//		
//	}
//
//}
	
	
//    @Test
//    public void testUpdateCategory() {
//    	
//    	category = categoryDAO.get(3);
//    	
//    	category.setName("Sds");
//    	
//    	assertEquals("Successfully updated a single category in the table!", true, categoryDAO.update(category));
//    	
//    }
	
	
//	@Test
//	public void testDeleteCategory() {
//		
//		category = categoryDAO.get(3);
//		
//		assertEquals("Successfully deleted a single category in the table!", true, categoryDAO.delete(category));
//		
//	}
    
//	@Test
//	public void testListCategory() {
//		
//		assertEquals("Successfully fetched the list of categories from the table!", 3, categoryDAO.list().size());
//		
//	}
	
	
	@Test
	public void testCRUDCategory() {
		
		// add operation
		category = new Category();
		
		category.setName("Boots");
		category.setDescription("Description for snow boots");
		category.setImageURL("Boots_01.png");
		
		assertEquals("Successfully added a category inside the table!", true, categoryDAO.add(category));
		
		category = new Category();
		
		category.setName("Bindings");
		category.setDescription("Description for bindings");
		category.setImageURL("Bindings_02.png");
		
		assertEquals("Successfully added a category inside the table!", true, categoryDAO.add(category));
		
		// update operation
		category = categoryDAO.get(2);
		
		category.setName("Snowboard");
		
		assertEquals("Successfully updated a single category in the table!", true, categoryDAO.update(category));
		
		// delete operation
		assertEquals("Successfully deleted a single category in the table!", true, categoryDAO.delete(category));
		
		// fetching the list
		assertEquals("Successfully fetched the list of categories from the table!", 1, categoryDAO.list().size());
		
		
		
	}

    
    
    
    
    
    
}








