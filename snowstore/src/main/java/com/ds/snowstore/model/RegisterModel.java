package com.ds.snowstore.model;

import java.io.Serializable;

import com.ds.storebackend.dto.Address;
import com.ds.storebackend.dto.User;

public class RegisterModel implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	// private fields
	
	private User user;
	private Address billing;
	
	// getters and setters
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getBilling() {
		return billing;
	}
	public void setBilling(Address billing) {
		this.billing = billing;
	}

}
