package com.ds.storebackend.dao;

import java.util.List;

import com.ds.storebackend.dto.Address;
import com.ds.storebackend.dto.Cart;
import com.ds.storebackend.dto.User;

public interface UserDAO {
	
	// add an user
	boolean addUser(User user);
	
	// find a specific User
	User getByEmail(String email);
	
	// add an address
	boolean addAddress(Address address);
	
	// alterntive so that we do not have so many querries (important for performace)
	// Address getBillingAddress(int userId);
	// List<Address> listShippingAddresses(int userId);
	
	Address getBillingAddress(User user);
	List<Address> listShippingAddresses(User user);
	
	// add a cart
	boolean updateCart(Cart cart);

}
