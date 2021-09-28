package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.User;

public interface InterestDAO {

	public boolean addActivityToUserInterest(Activity activity, User user);
	public void removeActivityFromUserInterest(Activity activity, User user);
}
