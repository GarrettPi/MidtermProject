package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO activityDao;

	// Submits active search form and directs to results page
	@RequestMapping(path = "searchActive.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView searchActive(@RequestParam("keyword") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/activityListOutdoor");
		mv.addObject("a", activityDao.findActiveActivity(keyword));
		return mv;
	}

	// Submits couch search form and directs to results page
	@RequestMapping(path = "searchCouch.do")
	public ModelAndView searchCouch(String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("couchPotatoPath/activityListIndoor");
		mv.addObject("a", activityDao.findCouchActivity(keyword));
		return mv;
	}

	// Submits selected active result form and directs to activity details page
	@RequestMapping(path = "selectActive.do")
	public ModelAndView selectActive(Integer actId, Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/detailsPageOutdoor");
		mv.addObject("activity", activityDao.findActivityById(actId));
		return mv;
	}

	// Submits selected couch result form and directs to activity details page
	@RequestMapping(path = "selectCouch.do")
	public ModelAndView selectCouch(Integer actId, Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("couchPotatoPath/detailsPageIndoor");
		mv.addObject("activity", activityDao.findActivityById(actId));
		return mv;
	}

}
