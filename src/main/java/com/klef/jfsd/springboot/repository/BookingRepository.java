package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {
    
}

