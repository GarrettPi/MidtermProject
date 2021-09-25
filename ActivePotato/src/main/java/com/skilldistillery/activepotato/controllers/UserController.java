package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	//Submits login form and directs to user home page
	@RequestMapping(path = "login.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	//Directs to user registration page
	@RequestMapping(path = "registerpage.do")
	public ModelAndView newUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	//Submits registration form and directs to user home page
	@RequestMapping(path = "register.do")
	public ModelAndView register(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	//Directs to edit profile page
	@RequestMapping(path = "editProfile.do")
	public ModelAndView editProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	//Submits edit details form and directs to user home page
	@RequestMapping(path = "edit.do")
	public ModelAndView submitEdits(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

}
