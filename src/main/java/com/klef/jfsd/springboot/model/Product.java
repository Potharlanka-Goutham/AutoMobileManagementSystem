package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "products")
public class Product 
{
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int id;
	  
	  @Column(nullable = true,length = 100)
	  private String category;
	  
	  @Column(nullable = true,length = 100)
	  private String name;
	  
	  @Column(nullable = true,length = 100)
	  private String companyname;
	  
	  @Column(nullable = true,length = 2000)
	  private String description;
	  
	  @Column(nullable = true)
	  private double cost;
	  
	  @Column(length = 200)
	  private int stock;
	  
	  
	  private Blob productimage1; 
	  
	  private Blob productimage2;
	  
	  private Blob productimage3;
	  
	  private Blob productimage4;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Blob getProductimage1() {
		return productimage1;
	}

	public void setProductimage1(Blob productimage1) {
		this.productimage1 = productimage1;
	}

	public Blob getProductimage2() {
		return productimage2;
	}

	public void setProductimage2(Blob productimage2) {
		this.productimage2 = productimage2;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public Blob getProductimage3() {
		return productimage3;
	}

	public void setProductimage3(Blob productimage3) {
		this.productimage3 = productimage3;
	}

	public Blob getProductimage4() {
		return productimage4;
	}

	public void setProductimage4(Blob productimage4) {
		this.productimage4 = productimage4;
	}
}
