package com.ds.storebackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ds.storebackend.dao.UserDAO;
import com.ds.storebackend.dto.Address;
import com.ds.storebackend.dto.Cart;
import com.ds.storebackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.ds.storebackend");
		context.refresh();

		userDAO = (UserDAO) context.getBean("userDAO");
	}

	/*
	 * @Test public void testAdd() {
	 * 
	 * user = new User(); user.setFirstName("Ana"); user.setLastName("Vlad");
	 * user.setEmail("anavlad@gmail.com"); user.setContactNumber("0712345678");
	 * user.setRole("USER"); user.setPassword("ana");
	 * 
	 * // add the user assertEquals("Failed to add user!", true,
	 * userDAO.addUser(user));
	 * 
	 * address = new Address(); address.setAddressLineOne("Margeanului 16");
	 * address.setAddressLineTwo("Mihai Bravu 196"); address.setCity("Bucharest");
	 * address.setState("Bucharest"); address.setCountry("Romania");
	 * address.setPostalCode("123456"); address.setBilling(true);
	 * 
	 * // link the user with the address using userId
	 * address.setUserId(user.getId());
	 * 
	 * // add the address assertEquals("Failed to add address!", true,
	 * userDAO.addAddress(address));
	 * 
	 * if (user.getRole().equals("USER")) {
	 * 
	 * // create a cart for this user
	 * 
	 * cart = new Cart(); cart.setUser(user);
	 * 
	 * // add the cart assertEquals("Failed to add cart!", true,
	 * userDAO.addCart(cart));
	 * 
	 * // add a shipping address for this user
	 * 
	 * address = new Address(); address.setAddressLineOne("Margeanului 16");
	 * address.setAddressLineTwo("Mihai Bravu 196"); address.setCity("Bucharest");
	 * address.setState("Bucharest"); address.setCountry("Romania");
	 * address.setPostalCode("123456"); // set shipping to true
	 * address.setShipping(true);
	 * 
	 * // link address with the user address.setUserId(user.getId());
	 * 
	 * // add the shipping address assertEquals("Failed to add shipping address!",
	 * true, userDAO.addAddress(address)); } }
	 */

	/*
	 * @Test public void testAdd() {
	 * 
	 * user = new User(); user.setFirstName("Ana"); user.setLastName("Vlad");
	 * user.setEmail("anavlad@gmail.com"); user.setContactNumber("0712345678");
	 * user.setRole("USER"); user.setPassword("ana");
	 * 
	 * if (user.getRole().equals("USER")) {
	 * 
	 * // create a cart for this user cart = new Cart();
	 * 
	 * cart.setUser(user);
	 * 
	 * // atach cart with the user user.setCart(cart);
	 * 
	 * }
	 * 
	 * // add the user assertEquals("Failed to add user!", true,
	 * userDAO.addUser(user)); }
	 */

	/*
	 * @Test public void testUpdateCart() {
	 * 
	 * // fetch the user by email user = userDAO.getByEmail("anavlad@gmail.com");
	 * 
	 * // get the cart of the user cart = user.getCart();
	 * 
	 * cart.setGrandTotal(1111);
	 * 
	 * cart.setCartLines(3);
	 * 
	 * assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));
	 * 
	 * 
	 * }
	 */

	/*
	 * @Test public void testAddAddress() {
	 * 
	 * // we need to add an user user = new User(); user.setFirstName("Ana");
	 * user.setLastName("Vlad"); user.setEmail("anavlad@gmail.com");
	 * user.setContactNumber("0712345678"); user.setRole("USER");
	 * user.setPassword("ana");
	 * 
	 * assertEquals("Failed to add user!", true, userDAO.addUser(user));
	 * 
	 * // we are going to add the address address = new Address();
	 * address.setAddressLineOne("Margeanului 16");
	 * address.setAddressLineTwo("Mihai Bravu 196"); address.setCity("Bucharest");
	 * address.setState("Bucharest"); address.setCountry("Romania");
	 * address.setPostalCode("123456"); address.setBilling(true);
	 * 
	 * // link the user with the address using userId address.setUser(user);
	 * 
	 * // add the address assertEquals("Failed to add address!", true,
	 * userDAO.addAddress(address));
	 * 
	 * // we are also going to add the shipping address address = new Address();
	 * address.setAddressLineOne("Margeanului 16");
	 * address.setAddressLineTwo("Mihai Bravu 196"); 
	 * address.setCity("Bucharest");
	 * address.setState("Bucharest"); 
	 * address.setCountry("Romania");
	 * address.setPostalCode("123456"); // set shipping to true
	 * address.setShipping(true);
	 * 
	 * // link address with the user address.setUser(user);
	 * 
	 * // add the shipping address assertEquals("Failed to add shipping address!",
	 * true, userDAO.addAddress(address)); }
	 */

/*	@Test
	public void testAddAddress() {
		
		user = userDAO.getByEmail("anavlad@gmail.com");

		// we are going to add the address
		address = new Address();
		address.setAddressLineOne("Victoriei 3");
		address.setAddressLineTwo("Grigore Nicolae");
		address.setCity("Campina");
		address.setState("Prahova");
		address.setCountry("Romania");
		address.setPostalCode("105600");
		address.setShipping(true);

		// link the user with the address using user obj
		address.setUser(user);

		// add the address
		assertEquals("Failed to add address!", true, userDAO.addAddress(address));

	}*/
	
	@Test
	public void testGetAddresses() {
		
		user = userDAO.getByEmail("anavlad@gmail.com");
		
		
		assertEquals("Failed to fetch the list of address and size does not match!", 2, 
				userDAO.listShippingAddresses(user).size());
		
		
		assertEquals("Failed to fetch the biling address and field does not match", "Bucharest",
				userDAO.getBillingAddress(user).getCity());
		
	}

	
	

}
