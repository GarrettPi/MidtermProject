package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Activity;

public interface ActivityDAO {

	public List <Activity> findActivityByName(String search);
	public Activity findActivityById(int id);
	public Activity addNewActivity(Activity activity);
	public boolean deleteActivity(int id);
	public Activity updateActivity(Activity activity);
	
}
