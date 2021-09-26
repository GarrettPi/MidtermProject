package com.skilldistillery.activepotato.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="activity_category")
public class ActivityCategory {

	public ActivityCategory() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy="activityCategory")
	private List<Activity> activityCatList;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Activity> getActivityCatList() {
		return activityCatList;
	}

	public void setActivityCatList(List<Activity> activityCatList) {
		this.activityCatList = activityCatList;
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
		ActivityCategory other = (ActivityCategory) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ActivityCategory [id=" + id + ", name=" + name + "]";
	}

	

	
	

}
