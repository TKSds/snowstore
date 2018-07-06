package com.ds.storebackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Cart {
	
	// Private Fields
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	/*------------------*/
	
	@OneToOne
	private User user;
	
	/*------------------*/

	@Column(name = "cart_lines")
	private int cartLines;
	
	@Column(name = "grand_total")
	private double grandTotal;
	
	// Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}	

	public int getCartLines() {
		return cartLines;
	}

	public void setCartLines(int cartLines) {
		this.cartLines = cartLines;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	// toString for logger and debugging activity
	
	@Override
	public String toString() {
		return "Cart [id=" + id + ", user=" + user + ", cartLines=" + cartLines + ", grandTotal=" + grandTotal
				+ "]";
	}

}
