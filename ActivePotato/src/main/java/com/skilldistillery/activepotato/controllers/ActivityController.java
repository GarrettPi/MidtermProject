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
	@RequestMapping(path = "searchActive.do", params="keyword", method=RequestMethod.GET)
	public ModelAndView searchActive(@RequestParam("keyword") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("************* mv instant ***********************");
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/activityListOutdoor");
		System.out.println("************* view set ***********************");
		mv.addObject("a", activityDao.findActivityByName(keyword));
		System.out.println("************* object added ***********************");
		return mv;
	}

	// Submits couch search form and directs to results page
	@RequestMapping(path = "searchCouch.do")
	public ModelAndView searchCouch(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("couchPotatoPath/activityListIndoor");
		return mv;
	}

	// Submits selected active result form and directs to activity details page
	@RequestMapping(path = "selectActive.do")
	public ModelAndView selectActive(Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("activePotatoPath/detailsPageOutdoor");
		return mv;
	}

	// Submits selected couch result form and directs to activity details page
	@RequestMapping(path = "selectCouch.do")
	public ModelAndView selectCouch(Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("couchPotatoPath/detailsPageIndoor");
		return mv;
	}

}
