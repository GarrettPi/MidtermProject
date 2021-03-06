package com.skilldistillery.activepotato.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="activity_type")
@Entity
public class ActivityType {

	public ActivityType() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="activity_url")
	private String url;

	public int getId() {
		return id;
	}

	@OneToMany(mappedBy="activityType")
	private List<Activity> activity;
		
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public List<Activity> getActivity() {
		return activity;
	}

	public void setActivity(List<Activity> activity) {
		this.activity = activity;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
		ActivityType other = (ActivityType) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ActivityType [id=" + id + ", name=" + name + "]";
	}

	
	
	
	
}

