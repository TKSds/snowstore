package com.ds.storebackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ds.storebackend.dao.CategoryDAO;
import com.ds.storebackend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	private static List<Category> categories = new ArrayList<>();
	
	static {
		Category category = new Category();
		
		//adding first category;  dummy data
		category.setId(1);
		category.setName("television");
		category.setDescription("description data");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
		
		//second category
		Category category2 = new Category();
		
		category2.setId(2);
		category2.setName("mobile");
		category2.setDescription("description data2");
		category2.setImageURL("CAT_2.png");
		
		categories.add(category2);
		
		//third category
		Category category3 = new Category();
		
		category3.setId(3);
		category3.setName("board");
		category3.setDescription("description data3");
		category3.setImageURL("CAT_3.png");
		
		categories.add(category3);
	}

	@Override
	public List<Category> list() {
		return categories;
	}

	@Override
	public Category get(int id) {
		
		// enhanced for loop
		for(Category category : categories) {		
			if(category.getId() == id) {
				return category;
			}	
		}
		
		return null;	
	}

}
