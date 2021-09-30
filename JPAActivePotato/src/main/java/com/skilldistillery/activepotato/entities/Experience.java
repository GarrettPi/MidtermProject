package com.skilldistillery.activepotato.entities;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Experience {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int rating;

	@Column(name = "experience_date")
	private LocalDate experienceDate;

	@ManyToOne
	@JoinColumn(name = "interest_id")
	private Interest interest;

	@Column(name="comment_id")
	private Integer commentId;
	
	//Methods
	@javax.persistence.Transient
	private LocalDate localDateNow = LocalDate.now();
	
	
	
	public LocalDate getLocalDateNow() {
		return localDateNow;
	}

	public void setLocalDateNow(LocalDate localDateNow) {
		this.localDateNow = localDateNow;
	}

	public Experience() {
		super();
	}

	public Interest getInterest() {
		return interest;
	}

	public void setInterest(Interest interest) {
		this.interest = interest;
	}

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

	public Integer getComment() {
		return commentId;
	}

	public void setComment(Integer commentId) {
		this.commentId = commentId;
	}

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
