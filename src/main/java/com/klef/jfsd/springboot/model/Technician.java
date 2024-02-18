package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Technician 
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String specializations;
    private String rating;
    private String password;
    
    private Blob profilepic;
    
    @OneToMany(mappedBy = "assignedTechnician") 
    private List<Vehicle> assignedVehicles;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSpecializations() {
		return specializations;
	}
	public void setSpecializations(String specializations) {
		this.specializations = specializations;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Vehicle> getAssignedVehicles() {
		return assignedVehicles;
	}
	public void setAssignedVehicles(List<Vehicle> assignedVehicles) {
		this.assignedVehicles = assignedVehicles;
	}
	public Blob getProfilepic() {
		return profilepic;
	}
	public void setProfilepic(Blob profilepic) {
		this.profilepic = profilepic;
	}

}
