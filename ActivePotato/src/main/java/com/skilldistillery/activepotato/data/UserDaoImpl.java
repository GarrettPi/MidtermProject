package com.skilldistillery.activepotato.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;
import com.skilldistillery.activepotato.security.PasswordUtilities;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUserId(int userid) {
		return em.find(User.class, userid);
	}

	@Override
	public User findByUsername(String username) {
		String jpql = "Select u from User u where u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("uname", username).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.print("No user found with username " + username);
		}
		return user;
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		String jpql = "Select u from User u where u.username = :uname and u.password = :upassword";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("uname", username).setParameter("upassword", password)
					.getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.print("No user found with this username and password");
		}
		return user;
	}

	@Override
	public List<User> findAllUsers() {

		String jpql = "Select u from User u";
		List<User> users = null;
		try {
			users = em.createQuery(jpql, User.class).getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			System.err.print("No users were found");
		}
		return users;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User deleteUser(User user) {
		em.remove(user);
		em.flush();
		return user;
	}

	@Override
	public User updateUser(int id, User user) {
		User dbUser = em.find(User.class, id);
		dbUser.setUsername(user.getUsername());
		dbUser.setPassword(user.getPassword());
		dbUser.setSalt(PasswordUtilities.getSalt(30));
		String newPassword = user.getPassword();
		System.out.println("******************************************"+newPassword+"*****************************************************");
		dbUser.setPassword(PasswordUtilities.generateSecurePassword(user.getPassword(), dbUser.getSalt()));
		dbUser.setFirstName(user.getFirstName());
		dbUser.setLastName(user.getLastName());
		dbUser.setEmail(user.getEmail());
		dbUser.setProfileUrl(user.getProfileUrl());
		

		return dbUser;
	}

	@Override
	public List<Interest> findInterestsByUserId(int userId) {
		List<Interest> list = new ArrayList<Interest>();
		String query = "SELECT i from Interest i join fetch i.activity where i.user.id = :id";
		list = em.createQuery(query, Interest.class).setParameter("id", userId).getResultList();
		return null;
	}
	
	

}
