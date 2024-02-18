package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class BookTechnician 
{
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    @ManyToOne
	    @JoinColumn(name = "technician_id")
	    private Technician technician;

	    @ManyToOne
	    @JoinColumn(name = "vehicle_id")
	    private Vehicle vehicle;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public Technician getTechnician() {
			return technician;
		}

		public void setTechnician(Technician technician) {
			this.technician = technician;
		}

		public Vehicle getVehicle() {
			return vehicle;
		}

		public void setVehicle(Vehicle vehicle) {
			this.vehicle = vehicle;
		}


}
