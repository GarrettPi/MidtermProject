package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		model.addAttribute("DEBUG", dao.findByUsername("jt"));
		return "home";
	}

	// Directs to page with login form
	@RequestMapping(path = "loginpage.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userLogin");
		return mv;
	}

	// Directs to page with couch potato search
	@RequestMapping(path = "couch.do")
	public ModelAndView couch(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("couchPotatoPath/indoorSearch");
		return mv;
	}

	// Directs to page with active potato search
	@RequestMapping(path = "active.do")
	public ModelAndView active(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("activePotatoPath/outdoorSearch");
		return mv;
	}
}
