package com.skilldistillery.activepotato.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;

@Service
@Transactional
public class InterestDaoImpl implements InterestDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Interest addActivityToUserInterest(Activity activity, User user) {
		String query = "select i from Interest i where i.user.id = :userId and i.activity.id = :actId";
		Interest interest = em.createQuery(query, Interest.class).setParameter("userId", user.getId())
				.setParameter("actId", activity.getId()).getSingleResult();
		if (interest == null) {
			Interest newInterest = new Interest();
			newInterest.setUser(user);
			newInterest.setActivity(activity);
			em.persist(newInterest);
			em.flush();
			return newInterest;
		} else {
			return interest;
		}
	}

	@Override
	public void removeActivityFromUserInterest(Activity activity, User user) {
		List<Experience> experiences = new ArrayList<>();
		String query = "select i from Interest i where i.user.id = :userId and i.activity.id = :actId";
		Interest interest = em.createQuery(query, Interest.class).setParameter("userId", user.getId())
				.setParameter("actId", activity.getId()).getSingleResult();
		query = "select e from Experience e where e.interest.id = :intId";
		experiences = em.createQuery(query, Experience.class).setParameter("intId", interest.getId()).getResultList();
		if (experiences.isEmpty()) {
			em.remove(interest);
		} else {
			for (Experience e : experiences) {
				em.remove(e);
			}
			em.remove(interest);
		}
	}

}
