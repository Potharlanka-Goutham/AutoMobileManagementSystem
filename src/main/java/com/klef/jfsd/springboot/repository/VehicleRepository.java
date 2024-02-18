package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.klef.jfsd.springboot.model.Vehicle;

public interface VehicleRepository extends JpaRepository<Vehicle, Integer> {

}
