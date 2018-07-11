package com.ds.storebackend.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Private Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/*-----------------------------------*/

	// An user can have Many Addresses
	@ManyToOne
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*-----------------------------------*/

	@Column(name = "address_line_one")
	@NotBlank(message = "Please enter address one")
	private String addressLineOne;

	@Column(name = "address_line_two")
	@NotBlank(message = "Please enter address two")
	private String addressLineTwo;

	@NotBlank(message = "Please enter city")
	private String city;
	
	@NotBlank(message = "Please enter state")
	private String state;
	
	@NotBlank(message = "Please enter country")
	private String country;

	@Column(name = "postal_code")
	@Size(min=2, max=8)
	@NotBlank(message = "Please enter postal code, must not exceed the value of 8!")
	private String postalCode;

	private boolean billing;
	private boolean shipping;

	// Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddressLineOne() {
		return addressLineOne;
	}

	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}

	public String getAddressLineTwo() {
		return addressLineTwo;
	}

	public void setAddressLineTwo(String addressLineTwo) {
		this.addressLineTwo = addressLineTwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public boolean isBilling() {
		return billing;
	}

	public void setBilling(boolean billing) {
		this.billing = billing;
	}

	public boolean isShipping() {
		return shipping;
	}

	public void setShipping(boolean shipping) {
		this.shipping = shipping;
	}

	// toString for logger and debugging activity

	@Override
	public String toString() {
		return "Address [id=" + id + ", user=" + user + ", addressLineOne=" + addressLineOne + ", addressLineTwo="
				+ addressLineTwo + ", city=" + city + ", state=" + state + ", country=" + country + ", postalCode="
				+ postalCode + ", billing=" + billing + ", shipping=" + shipping + "]";
	}

}
