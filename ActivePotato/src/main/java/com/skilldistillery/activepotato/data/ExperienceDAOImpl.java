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
public class ExperienceDAOImpl implements ExperienceDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Experience> findExperienceById(int experienceId) {
		List <Experience> expList = null;
		try {
			String query = "SELECT e FROM Experience e WHERE  = :eid";
			expList = em.createQuery(query, Experience.class)
						.setParameter("eid", experienceId)
						.getResultList();
						
		} catch (Exception e) {
			System.out.println("No experiences found with Experience ID: " + experienceId);
		}
				
		return expList;
	}

	@Override
	public List <List<Experience>> findExperienceByUserId(int userId) {
		User user = em.find(User.class, userId);
		List <List <Experience>> expList = new ArrayList<>();
		
		List <Interest> interestList = user.getInterestList();
		for (Interest i : interestList) {
			
			expList.add(i.getExperience());
		}
				
		return expList;
	}

	@Override
	public Experience addExperience(Experience experience) {
		em.persist(experience);
		em.flush();
		return experience;
	}

	@Override
	public boolean deleteExperience(int experienceId) {
		boolean result = false;
		Experience experience = em.find(Experience.class, experienceId);
		em.remove(experience);
		
		result = ! em.contains(experience);
		
		return result;
	}

	@Override
	public Experience updateExperience(Experience experience) {
		em.persist(experience);
		em.flush();	
		
		return experience;
	}

	
	@Override
	public List<Experience> findExperiencesByActivityId(int actId){
		List<Experience> experiences = new ArrayList<>();
		String query = "SELECT e FROM Experience e JOIN e.interest i WHERE i.activity.id = :id";
		experiences = em.createQuery(query, Experience.class).setParameter("id", actId).getResultList();
		
		return experiences;
	}


}
