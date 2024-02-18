package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.BookingDetails;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Technician;


public interface AdminService {

	public List<Customer> viewallemps();
	public String deleteemp(int eid);
	public Customer viewempbyid(int cid);
	public Admin checkadminlogin(String auname, String apwd);
	
	public List<BookingDetails> viewAllBookingsWithCustomerDetails();
	
	public String deleteProduct(int pid);
	
	public String addtechinican(Technician t);
}
