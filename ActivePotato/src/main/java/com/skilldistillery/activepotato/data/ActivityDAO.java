package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Activity;

public interface ActivityDAO {

	public List <Activity> findActivityByName(String search);
	public List<Activity> findActiveActivity(String keyword);
	public List<Activity> findCouchActivity(String keyword);
	public Activity findActivityById(int id);
	public Activity addNewActivity(Activity activity);
	public boolean deleteActivity(int id);
	public Activity updateActivity(int id, Activity activity);
	public List<Activity> findActivitiesByInterestUserId(int id);
	public Activity findActivityByInterestActivityId(int activityId);
}
