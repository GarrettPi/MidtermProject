package com.skilldistillery.activepotato.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findByUsername("jt"));
		return "home";
	}

	// Directs to page with login form
	@RequestMapping(path = "loginpage.do")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	// Directs to page with couch potato search
	@RequestMapping(path = "couch.do")
	public ModelAndView couch() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	// Directs to page with active potato search
	@RequestMapping(path = "active.do")
	public ModelAndView active() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
}
