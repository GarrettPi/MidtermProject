package com.skilldistillery.activepotato.data;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.ActivityCategory;
import com.skilldistillery.activepotato.entities.ActivityType;

@Service
@Transactional
public class ActivityDaoImpl implements ActivityDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Activity> findActiveActivity(String keyword) {

		List<Activity> activityList = null;

		try {

			String query = "SELECT a FROM Activity a JOIN a.activityCategory WHERE a.activityCategory.id = 2 AND a.name LIKE :keyword";
			activityList = em.createQuery(query, Activity.class).setParameter("keyword", "%" + keyword + "%")
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + keyword);

		}

		return activityList;
	}

	@Override
	public List<Activity> findCouchActivity(String keyword) {
		List<Activity> activityList = null;
		try {
			String query = "SELECT a FROM Activity a JOIN a.activityCategory WHERE a.activityCategory.id = 1 AND a.name LIKE :keyword";

			activityList = em.createQuery(query, Activity.class).setParameter("keyword", "%" + keyword + "%")
					.getResultList();
			System.out.println(activityList);
		} catch (Exception e) {
			System.out.println("No activity found matching: " + keyword);

		}
		return activityList;
	}

	@Override
	public List<Activity> findActivityByName(String search) {
		List<Activity> activityList = null;
		try {

			String query = "SELECT a FROM Activity a WHERE a.name LIKE :act";
			activityList = em.createQuery(query, Activity.class).setParameter("act", "%" + search + "%")
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + search);

		}

		return activityList;
	}

	@Override
	public Activity findActivityById(int id) {
		Activity activity = em.find(Activity.class, id);

		return activity;
	}

	@Override
	public Activity addNewActivity(Activity activity) {
		Activity dbActivity = activity;
		em.persist(dbActivity);
		em.flush();
		return dbActivity;
	}

	@Override
	public boolean deleteActivity(int id) {
		boolean result = false;
		Activity activity = em.find(Activity.class, id);
		em.remove(activity);

		result = !em.contains(activity);

		return result;
	}

	@Override
	public Activity updateActivity(int id, Activity activity) {

		Activity dbActivity = em.find(Activity.class, id);
		LocalDate now = LocalDate.now();
		dbActivity.setName(activity.getName());
		dbActivity.setExpectedDuration(activity.getExpectedDuration());
		dbActivity.setDescription(activity.getDescription());
		dbActivity.setUrl(activity.getUrl());
		dbActivity.setImageUrl(activity.getImageUrl());
		dbActivity.setActivityType(activity.getActivityType());
		dbActivity.setUser(activity.getUser());
		dbActivity.setLastUpdateDate(now);
		dbActivity.setComments(activity.getComments());
		dbActivity.setActivityRatings(activity.getActivityRatings());

		return dbActivity;
	}

	@Override
	public List<Activity> findActivitiesByInterestUserId(int id) {
		List<Activity> activities = new ArrayList<>();
		String query = "select a from Activity a join fetch a.interest i where i.user.id = :userId ";

		activities = em.createQuery(query, Activity.class).setParameter("userId", id).getResultList();

		return activities;
	}

	@Override
	public Activity findActivityByInterestActivityId(int activityId) {
		Activity act = null;
		String query = "select a from Activity a where id = :id";
		act = em.createQuery(query, Activity.class).setParameter("id", activityId).getSingleResult();
		return act;
	}

	@Override
	public List<ActivityCategory> findAllActivityCategories() {
		List<ActivityCategory> categories = new ArrayList<>();
		String query = "select c from ActivityCategory c";
		categories = em.createQuery(query, ActivityCategory.class).getResultList();
		return categories;
	}

	@Override
	public List<ActivityType> findAllActivityTypes() {
		List<ActivityType> types = new ArrayList<>();
		String query = "select t from ActivityType t";
		types = em.createQuery(query, ActivityType.class).getResultList();
		return types;
	}

	@Override
	public ActivityType findTypeById(int id) {
		ActivityType type = em.find(ActivityType.class, id);
		return type;
	}

	@Override
	public ActivityCategory findCategoryById(int id) {
		ActivityCategory category = em.find(ActivityCategory.class, id);
		return category;
	}

}
