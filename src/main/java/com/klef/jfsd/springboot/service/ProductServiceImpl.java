package com.klef.jfsd.springboot.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Product;
import com.klef.jfsd.springboot.repository.ProductRepository;


@Service
public class ProductServiceImpl implements ProductService
{

	@Autowired
	private ProductRepository productRepository;
	
	
	@Override
	public String addproduct(Product p) 
	{
		productRepository.save(p);
		
		return "Registration Successfull......!";
	}

	@Override
	public Product ViewProductByID(int productid) 
	{
		return productRepository.findById(productid).get();
	}

	@Override
	public List<Product> ViewAllProducts() 
	{
		return  (List<Product>) productRepository.findAll();
	}

	@Override
	public String updateProduct(Product product) {
		
		productRepository.save(product);
		
		return "Updated successfully";
	}
	


}
