package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Product;

public interface ProductService 
{
	
    public String addproduct(Product p);
	
	public Product ViewProductByID(int productid);
	
	public List<Product> ViewAllProducts();

	public String updateProduct(Product product);
	
	

}
