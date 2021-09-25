package com.skilldistillery.activepotato.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.Activity;

@Service
@Transactional
public class ActivityDaoImpl implements ActivityDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Activity> findActivityByName(String search) {
		List<Activity> activityList = null;
		try {
			
		String query = "SELECT a FROM Activity a WHERE a.name LIKE % :act";
		activityList = em.createQuery(query, Activity.class)
					.setParameter("act", search)
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
				
		return dbActivity;
	}

	@Override
	public boolean deleteActivity(int id) {
		boolean result = false;
		Activity activity = em.find(Activity.class, id);
		em.remove(activity);
		
		result = ! em.contains(activity);
		
		return result;
	}

	@Override
	public Activity updateActivity(Activity activity) {
		
		//Add to controller, then delete//
//		Activity dbActivity = em.find(Activity.class, id);
//		LocalDate now = LocalDate.now();
//		dbActivity.setName(activity.getName());
//		dbActivity.setExpectedDuration(activity.getExpectedDuration());
//		dbActivity.setDescription(activity.getDescription());
//		dbActivity.setUrl(activity.getUrl());
//		dbActivity.setImageUrl(activity.getImageUrl());
//		dbActivity.setActivityType(activity.getActivityType());
//		dbActivity.setUser(activity.getUser());
//		dbActivity.setLastUpdateDate(now);
//		dbActivity.setComments(activity.getComments());
//		dbActivity.setActivityRatings(activity.getActivityRatings());
		//Add to controller, then delete//

		em.persist(activity);
		em.flush();
		
		return activity;
	}
	
}
