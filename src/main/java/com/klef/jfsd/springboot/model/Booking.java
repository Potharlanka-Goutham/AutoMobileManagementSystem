package com.klef.jfsd.springboot.model;

import java.sql.Timestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String pickupLocation;
    private String dropOffLocation;
    private String pickupDate;
    private String dropOffDate;
    
    @ManyToOne 
    @JoinColumn(name = "customer_id")
    private Customer customer; 
    
    
    private Timestamp timestamp;

    
   
	public String getPickupLocation() {
		return pickupLocation;
	}
	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}
	public String getDropOffLocation() {
		return dropOffLocation;
	}
	public void setDropOffLocation(String dropOffLocation) {
		this.dropOffLocation = dropOffLocation;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupdate2) {
		this.pickupDate = pickupdate2;
	}
	public String getDropOffDate() {
		return dropOffDate;
	}
	public void setDropOffDate(String dropOffDate) {
		this.dropOffDate = dropOffDate;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
    
}
