package com.klef.jfsd.springboot.model;

public class BookingDetails 
{
	private Booking booking;
    private Customer customer;
    
    
	public Booking getBooking() {
		return booking;
	}
	public void setBooking(Booking booking) {
		this.booking = booking;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
