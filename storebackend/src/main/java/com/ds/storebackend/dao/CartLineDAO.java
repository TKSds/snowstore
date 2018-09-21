package com.ds.storebackend.dao;

import java.util.List;

import com.ds.storebackend.dto.Cart;
import com.ds.storebackend.dto.CartLine;

public interface CartLineDAO {
	
	// common methods
	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	
	// other business methods related to the cart line
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndProduct(int cartId, int productId);
	
	// update a cart
	boolean updateCart(Cart cart);

}
