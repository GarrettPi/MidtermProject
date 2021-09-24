package com.skilldistillery.activepotato.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Activity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	

}
