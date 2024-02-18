package com.klef.jfsd.springboot.service;

import java.util.ArrayList;


import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.BookTechnician;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Technician;
import com.klef.jfsd.springboot.model.Vehicle;
import com.klef.jfsd.springboot.repository.BookTechnicianRepository;
import com.klef.jfsd.springboot.repository.TechnicianRepository;
import com.klef.jfsd.springboot.repository.VehicleRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class TechnicianServiceImpl implements TechnicianService 
{
	@Autowired
	private TechnicianRepository technicianRepository;
	
	@Autowired
	private VehicleRepository vehicleRepository;
	
	@Autowired
	private BookTechnicianRepository bookTechnicianRepository;
	
	@Autowired
    private HttpSession httpSession;
	
	
	

	@Override
	public Technician technicianlogin(String email, String password) 
	{
		
		return technicianRepository.technicianlogin(email, password);
	}

	 public String assignVehicleToTechnician(int technicianId, int vehicleId) {
	        // Retrieve the technician and vehicle from the database based on their IDs
	        Optional<Technician> technicianOptional = technicianRepository.findById(technicianId);
	        Optional<Vehicle> vehicleOptional = vehicleRepository.findById(vehicleId);

	        if (technicianOptional.isPresent() && vehicleOptional.isPresent()) {
	            Technician technician = technicianOptional.get();
	            Vehicle vehicle = vehicleOptional.get();

	            // Create a new BookTechnician entity and set the relationships
	            BookTechnician bookTechnician = new BookTechnician();
	            bookTechnician.setTechnician(technician);
	            bookTechnician.setVehicle(vehicle);

	            // Save the BookTechnician entity to the database
	            bookTechnicianRepository.save(bookTechnician);

	            return "Vehicle assigned to the technician successfully.";
	        } else {
	            return "Technician or vehicle not found. Assignment failed.";
	        }
	    }

	
	public Technician getTechnicianById(int technicianId) 
	{
	    return technicianRepository.findById(technicianId).get();
	}


	public List<Vehicle> getAssignedVehiclesByTechnician(int technicianId) 
	{
	    Technician technician = technicianRepository.findById(technicianId).get();
	    
	    if (technician != null) {
	        return technician.getAssignedVehicles();
	    } else {
	        return Collections.emptyList();
	    }
	}

	public List<Technician> getAllTechnicians() {
        
        return technicianRepository.findAll();
    }

	@Override
	public List<Vehicle> getAllVehicles() {
		
		return vehicleRepository.findAll();
	}

	@Override
	public List<BookTechnician> getalltechnicianbookings() 
	{
       Iterable<BookTechnician> iterable = bookTechnicianRepository.findAll();  
        List<BookTechnician> technicianBookings = new ArrayList<>();
        iterable.forEach(technicianBookings::add);
        
        return technicianBookings;
	}

	@Override
	public Vehicle getVehicleById(int vechicleid) {
		
		return vehicleRepository.findById(vechicleid).get();
	}

	@Override
	public String addtechnician(Technician t) {
		technicianRepository.save(t);
		return "Added Successfully";
	}

	@Override
	public List<Vehicle> getAssignedVehiclesForTechnician(int technicianId) 
	{
	    return bookTechnicianRepository.getTechnicianVehicles(technicianId);
	}


	
	
}
