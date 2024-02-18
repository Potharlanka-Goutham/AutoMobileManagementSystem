package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
