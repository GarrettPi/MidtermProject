package com.skilldistillery.activepotato.entities;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Experience {

	public Experience() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public LocalDate getExperienceDate() {
		return experienceDate;
	}


	public void setExperienceDate(LocalDate experienceDate) {
		this.experienceDate = experienceDate;
	}


	@Column(name="experience_date")
	private LocalDate experienceDate;

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Experience other = (Experience) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "Experience [id=" + id + ", rating=" + rating + ", experienceDate=" + experienceDate + "]";
	}
	
	
	
}
