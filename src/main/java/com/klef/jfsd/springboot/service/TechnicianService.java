package com.klef.jfsd.springboot.service;


import java.util.List;

import com.klef.jfsd.springboot.model.BookTechnician;
import com.klef.jfsd.springboot.model.Technician;
import com.klef.jfsd.springboot.model.Vehicle;

public interface TechnicianService 
{
	public Technician technicianlogin(String email,String password);
	
	public String addtechnician(Technician t);
	
	
	public String assignVehicleToTechnician(int technicianId, int vehicleId);
	
	public Technician getTechnicianById(int technicianId);
	
	public List<Technician> getAllTechnicians();
	
	public List<Vehicle> getAllVehicles();
	
	public List<BookTechnician> getalltechnicianbookings();
	
	public Vehicle getVehicleById(int vechicleid);
	
	public List<Vehicle> getAssignedVehiclesForTechnician(int technicianId);

}
