package com.skilldistillery.activepotato.controllers;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.ExperienceDAO;
import com.skilldistillery.activepotato.data.InterestDAO;
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class ExperienceController {

	@Autowired
	ExperienceDAO expDao;
	@Autowired
	ActivityDAO actDao;
	@Autowired
	InterestDAO intDao;

	@RequestMapping(path = "addExperience.do", method = RequestMethod.POST)
	public ModelAndView addExperience(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Activity activity = actDao.findActivityById(id);
		Interest interest = intDao.addActivityToUserInterest(activity, user);
		System.out.println(interest);
		mv.setViewName("createExperience");
		mv.addObject("interest", interest);
		return mv;
	}

	@RequestMapping(path = "createExperience.do", method = RequestMethod.POST)
	public ModelAndView createExperience(HttpSession session, Experience experience, int interestId, @RequestParam("expDate") String date) {
		LocalDate localDate = LocalDate.parse(date);
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Interest interest = intDao.findInterestById(interestId);
		System.out.println("***************************************************"+interest+"*******************************************");
		experience.setInterest(interest);
		experience.setExperienceDate(localDate);
		expDao.addExperience(experience);
		mv.setViewName("userHome");
		mv.addObject("acts", actDao.findActivitiesByInterestUserId(user.getId()));
		return mv;
	}
}
