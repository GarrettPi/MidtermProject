package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.Interest;

public interface ExperienceDAO {

	public Experience findExperienceById(int experienceId);
	public List <List<Experience>> findExperienceByUserId(int userId);
	public Experience addExperience(Experience experience);
	public boolean deleteExperience(int experienceId);
	public Experience updateExperience(Experience experience);
	public List<Experience> findExperiencesByActivityId(int actId);
	public void setExperienceCommentId (int expId, int commentId);
}
