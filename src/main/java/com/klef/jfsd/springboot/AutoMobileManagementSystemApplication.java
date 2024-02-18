package com.klef.jfsd.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.klef.jfsd.springboot"})
public class AutoMobileManagementSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(AutoMobileManagementSystemApplication.class, args);
		System.out.println("Project is working Fine........!");
	}

}
