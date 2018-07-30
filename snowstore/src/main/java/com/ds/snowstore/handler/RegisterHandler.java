package com.ds.snowstore.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.ds.snowstore.model.RegisterModel;
import com.ds.storebackend.dao.UserDAO;
import com.ds.storebackend.dto.Address;
import com.ds.storebackend.dto.Cart;
import com.ds.storebackend.dto.User;

@Component
public class RegisterHandler {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public RegisterModel init() {
		return new RegisterModel();
	}
	
	public void addUser(RegisterModel registerModel, User user) {
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel, Address billing) {
		registerModel.setBilling(billing);
	}
	
	public String validateUser(User user, MessageContext error) {
		
		String transitionValue = "success";
		
		// check if password matches confirm password
		
		if(!(user.getPassword().equals(user.getConfirmPassword()))) {
			
			error.addMessage(new MessageBuilder()
					.error()
					.source("confirmPassword")
					.defaultText("Password does not match the confirm password!")
					.build());
			
			transitionValue = "failure";
		}
		
		// check the uniqueness of the email id
		
		if (userDAO.getByEmail(user.getEmail()) != null) {
			
			error.addMessage(new MessageBuilder()
					.error()
					.source("email")
					.defaultText("Email address is already used!")
					.build());
			
			transitionValue = "failure";
		}
		
		return transitionValue;
	}
	
	public String saveAll(RegisterModel model) {
		String transitionValue = "success";
		
		// fetch the user
		User user = model.getUser();
		
		if (user.getRole().equals("USER")) {
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		// encode the password
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		
		// save the user
		userDAO.addUser(user);
		
		// get the address
		Address billing = model.getBilling();
		
		billing.setUser(user);
		billing.setBilling(true);
		
		// save the billing address
		userDAO.addAddress(billing);
		
		return transitionValue;
	}
	
	

}
