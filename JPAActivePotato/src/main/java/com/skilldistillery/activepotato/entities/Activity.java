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
import javax.persistence.Transient;

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

	@Column(name="trailer_url")
	private String trailerUrl;

	@ManyToOne
	@JoinColumn(name = "activity_type_id")
	private ActivityType activityType;

	@ManyToOne
	@JoinColumn(name="activity_category_id")
	private ActivityCategory activityCategory;

	@Column(name = "create_date")
	private LocalDate createDate;
	
	@Column(name = "last_update_date")
	private LocalDate lastUpdateDate;
	
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy = "activity")
	private List<ActivityRating> activityRatings;



	@OneToMany(mappedBy = "activity")
	private List<Comment> comments;
	
	@OneToMany(mappedBy = "activity")
	private List<Interest> interest;
	
	
	@OneToMany(mappedBy="activity")
	private List<ActivityRating> activityRatingList;
	
	@Transient
	private Integer avgRating;

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

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public ActivityType getActivityType() {
		return activityType;
	}

	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}

	public ActivityCategory getActivityCategory() {
		return activityCategory;
	}

	public void setActivityCategory(ActivityCategory activityCategory) {
		this.activityCategory = activityCategory;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public LocalDate getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(LocalDate lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ActivityRating> getActivityRatings() {
		
		return new ArrayList<>(activityRatings);
	}

	public void setActivityRatings(List<ActivityRating> activityRatings) {
		this.activityRatings = activityRatings;
	}

	public List<Comment> getComments() {
		
		return new ArrayList<>(comments);
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Interest> getInterest() {
		
		return new ArrayList<>(interest);
	}

	public void setInterest(List<Interest> interest) {
		this.interest = interest;
	}

	public List<ActivityRating> getActivityRatingList() {
		
		return new ArrayList<>(activityRatingList);
	}

	public void setActivityRatingList(List<ActivityRating> activityRatingList) {
		this.activityRatingList = activityRatingList;
	}

	public Integer getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(Integer avgRating) {
		this.avgRating = avgRating;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", expectedDuration=" + expectedDuration + ", description="
				+ description + ", url=" + url + ", imageUrl=" + imageUrl + ", trailerUrl=" + trailerUrl
				+ ", activityType=" + activityType + ", activityCategory=" + activityCategory + ", createDate="
				+ createDate + ", lastUpdateDate=" + lastUpdateDate + ", user=" + user + ", interest=" + interest + "]";
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
