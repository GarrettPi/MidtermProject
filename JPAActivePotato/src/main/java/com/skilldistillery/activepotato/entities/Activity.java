package com.skilldistillery.activepotato.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Activity {

		
	public Activity() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "expected_duration")
	private Integer expectedDuration;

	private String description;
	private String url;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "create_date")
	private LocalDate createDate;
	
	@Column(name = "last_update_date")
	private LocalDate lastUpdateDate;
	
	@OneToMany(mappedBy = "activity")
	private List<ActivityRating> activityRatings;

	@ManyToOne
	@JoinColumn(name = "activity_type_id")
	private ActivityType activityType;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "activity")
	private List<Comment> comments;
	
	@OneToMany(mappedBy = "activity")
	private List<Interest> interest;
	
	@ManyToOne
	@JoinColumn(name="activity_category_id")
	private ActivityCategory activityCategory;

	public List<Interest> getInterest() {
		return interest;
	}

	public void setInterest(List<Interest> interest) {
		this.interest = interest;
	}


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

	public Integer getExpectedDuration() {
		return expectedDuration;
	}

	public void setExpectedDuration(Integer expectedDuration) {
		this.expectedDuration = expectedDuration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public List<ActivityRating> getActivityRatings() {
		return new ArrayList<>(activityRatings);
	}

	public void setActivityRatings(List<ActivityRating> activityRatings) {
		this.activityRatings = activityRatings;
	}

	public ActivityType getActivityType() {
		return activityType;
	}

	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public LocalDate getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(LocalDate lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public ActivityCategory getActivityCategory() {
		return activityCategory;
	}

	public void setActivityCategory(ActivityCategory activityCategory) {
		this.activityCategory = activityCategory;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", expectedDuration=" + expectedDuration + ", description="
				+ description + ", url=" + url + ", imageUrl=" + imageUrl + ", createDate=" + createDate + "]";
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
		Activity other = (Activity) obj;
		return id == other.id;
	}

}
