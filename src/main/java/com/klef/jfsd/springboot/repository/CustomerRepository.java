package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Customer;


@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer>
{
	@Query("select c from Customer c where username=?1 and password=?2")
	public Customer checkcustomerlogin(String username,String password) ;

}
