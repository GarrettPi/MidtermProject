package com.skilldistillery.activepotato.data;

import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;

public interface InterestDAO {

	public Interest addActivityToUserInterest(Activity activity, User user);
	public void removeActivityFromUserInterest(Activity activity, User user);
	public Interest findInterestByUserId(User user, Activity activity);
	public Interest findInterestById(int interestId);
}
