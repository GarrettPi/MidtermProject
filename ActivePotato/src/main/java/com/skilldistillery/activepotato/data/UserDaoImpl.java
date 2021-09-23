package com.skilldistillery.activepotato.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		String jpql = "Select u from User u where u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("uname", username)
					.getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.print("No user found with username " + username);
		}
		return user;
	}

}
