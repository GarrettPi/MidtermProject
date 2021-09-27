package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;

public interface UserDAO {

	public User findByUserId(int userid);
	public User findByUsername(String username);
	public List<User> findAllUsers();
	public User createUser(User user);
	public User deleteUser(User user);
	public User updateUser(int id, User user);
	public User findByUsernameAndPassword(String username, String password);
	public List<Interest> findInterestsByUserId(int userId);
	public boolean addActivityToUserInterest(Activity activity, User user);
}
