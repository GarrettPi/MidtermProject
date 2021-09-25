package com.skilldistillery.activepotato.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "login.do")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "registerpage.do")
	public ModelAndView newUser() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "register.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "editProfile.do")
	public ModelAndView editProfile() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

}
