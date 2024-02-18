package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.klef.jfsd.springboot.model.ProductBooking;

public interface ProductBookingRepository extends JpaRepository<ProductBooking, Integer> {

}
