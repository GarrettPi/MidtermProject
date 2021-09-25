package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.Activity;

@Controller
public class ActivityController {

	@Autowired
	private UserDAO userDao;

	//Submits active search form and directs to results page
	@RequestMapping(path = "searchActive.do")
	public ModelAndView searchActive(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("activePotatoPath/activityListOutdoor");
		return mv;
	}

	//Submits couch search form and directs to results page
	@RequestMapping(path = "searchCouch.do")
	public ModelAndView searchCouch(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("couchPotatoPath/activityListIndoor");
		return mv;
	}

	//Submits selected active result form and directs to activity details page
	@RequestMapping(path = "selectActive.do")
	public ModelAndView selectActive(Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("activePotatoPath/detailsPageOutdoor");
		return mv;
	}

	//Submits selected couch result form and directs to activity details page
	@RequestMapping(path = "selectCouch.do")
	public ModelAndView selectCouch(Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("couchPotatoPath/detailsPageIndoor");
		return mv;
	}

}
