package com.klef.jfsd.springboot.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.klef.jfsd.springboot.model.BookTechnician;
import com.klef.jfsd.springboot.model.Vehicle;

public interface BookTechnicianRepository extends CrudRepository<BookTechnician, Integer> {
	
	
	@Query("SELECT bt.vehicle FROM BookTechnician bt WHERE bt.technician.id = ?1")
	public List<Vehicle> getTechnicianVehicles(int technicianId);


}
