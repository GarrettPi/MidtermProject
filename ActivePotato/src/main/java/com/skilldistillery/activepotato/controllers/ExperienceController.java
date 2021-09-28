package com.skilldistillery.activepotato.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.ExperienceDAO;
import com.skilldistillery.activepotato.data.InterestDAO;
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class ExperienceController {

	@Autowired
	ExperienceDAO expDao;
	@Autowired
	ActivityDAO actDao;
	@Autowired
	InterestDAO intDao;
	
	@RequestMapping(path="addExperience.do", method=RequestMethod.POST)
	public ModelAndView addExperience(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Activity activity = actDao.findActivityById(id);
		List<Activity> interestActs = actDao.findActivitiesByInterestUserId(user.getId());
		if(interestActs.isEmpty() || !interestActs.contains(activity)) {
			intDao.addActivityToUserInterest(activity, user);
		}
		mv.setViewName("createExperience");
		return mv;
	}
	
	@RequestMapping(path="createExperience.do", method=RequestMethod.POST)
	public ModelAndView createExperience(HttpSession session, Experience experience) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}
