package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Experience;

public interface ExperienceDAO {

	public List<Experience> findExperienceById(int experienceId);
	public List <List<Experience>> findExperienceByUserId(int userId);
	public Experience addExperience(Experience experience);
	public boolean deleteExperience(int experienceId);
	public Experience updateExperience(Experience experience);
	
}
