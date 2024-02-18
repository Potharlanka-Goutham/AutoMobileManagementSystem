package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.klef.jfsd.springboot.model.Technician;

@Repository
public interface TechnicianRepository extends JpaRepository<Technician, Integer>
{
	
	@Query("select t from Technician t where email=?1 and password=?2")
	public Technician technicianlogin(String email,String password) ;
	
	

}
