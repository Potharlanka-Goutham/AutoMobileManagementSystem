package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Booking;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.ProductBooking;
import com.klef.jfsd.springboot.model.Vehicle;

public interface CustomerService 
{
	
	public String addcustomer(Customer c);
	
	public String updateprofile(Customer c);
	
	public Customer checkcustomerlogin(String username,String password);
	
	public Customer viewprofile(int id);
	
	
	public String bookService(Booking booking);
	
	public Customer findbyid(int id);
	
	public List<Booking> getBookingsForCustomer(int customerId);
	
	public Customer viewbyid(int id);
	
	
	public String bookproduct(ProductBooking productbooking);
	
	public List<ProductBooking> getOrdersByCustomer(int customerId);
	
	public String deleteProduct(int pid);
	
	

	public String addvehicle(Vehicle vehicle);
	
	public List<Vehicle> getcustomervehicles(int customerId);
	
	public Vehicle viewvehiclebyid(int id);
	
}
