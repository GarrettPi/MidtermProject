package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	// directs to the appropriate home page
	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "home";
		} else {
			model.addAttribute("user", (User)session.getAttribute("user"));
			return "userHome";
		}
	}

	// Directs to page with login form
	@RequestMapping(path = "loginpage.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("userLogin");
		} else {
			mv.setViewName("userHome");
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		return mv;
	}

	// Directs to page with couch potato search
	@RequestMapping(path = "couch.do")
	public ModelAndView couch(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("couchPotatoPath/indoorSearch");
		return mv;
	}

	// Directs to page with active potato search
	@RequestMapping(path = "active.do")
	public ModelAndView active(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/outdoorSearch");
		return mv;
	}
}
