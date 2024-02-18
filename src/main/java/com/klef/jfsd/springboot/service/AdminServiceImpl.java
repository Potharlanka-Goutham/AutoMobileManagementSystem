package com.klef.jfsd.springboot.service;

import java.util.ArrayList;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Booking;
import com.klef.jfsd.springboot.model.BookingDetails;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Product;
import com.klef.jfsd.springboot.model.Technician;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.BookingRepository;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;
import com.klef.jfsd.springboot.repository.TechnicianRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
    private BookingRepository bookingRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private TechnicianRepository technicianRepository;

	@Override
	public List<Customer> viewallemps() {
		
		return customerRepository.findAll();
	}

	@Override
	public String deleteemp(int eid)
	{
      return null;
	}

	@Override
	public Customer viewempbyid(int cid) 
	{
         
		Optional<Customer> obj = customerRepository.findById(cid);    
	    
	    if(obj.isPresent())
	    {
	      Customer c = obj.get();
	      return c;
	    }
	    else
	    {
	      return null;
	    }
	}

	@Override
	public Admin checkadminlogin(String auname, String apwd) {
		
		return adminRepository.checkadminlogin(auname, apwd);
	}

	
	public List<BookingDetails> viewAllBookingsWithCustomerDetails() 
	{
	    List<BookingDetails> bookingDetailsList = new ArrayList<>();

	    List<Booking> bookings = bookingRepository.findAll(); 
	    for (Booking booking : bookings) {
	        Customer customer = booking.getCustomer(); 

	        BookingDetails bookingDetails = new BookingDetails();
	        bookingDetails.setBooking(booking);
	        bookingDetails.setCustomer(customer);

	        bookingDetailsList.add(bookingDetails);
	    }

	    return bookingDetailsList;
	}
	

	@Override
	public String deleteProduct(int pid) 
	{
      Optional<Product> obj = productRepository.findById(pid);
	    
	    String msg = null;
	    
	    if(obj.isPresent())
	    {
	      Product p = obj.get();
	      productRepository.delete(p);
	      msg = "Product Deleted Successfully";
	    }
	    else
	    {
	      msg = "Product Not Found";
	    }
	    
	    return msg;
	}

	@Override
	public String addtechinican(Technician t) 
	{
		technicianRepository.save(t);
		
		return "Added Successfully";
	}

	
}
