package com.ds.snowstore.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ds.storebackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Product product = (Product) target;

		// check whether file has been selected or not
		if (product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {

			errors.rejectValue("file", null, "Please Select An Image File To Upload!");
			return;
		}

		if (!(product.getFile().getContentType().equals("image/jpg")
				|| product.getFile().getContentType().equals("image/png")
				|| product.getFile().getContentType().equals("image/gif"))) {

			errors.rejectValue("file", null, "Please Use Only Image Files For Upload!");
			return;

		}

	}

}
