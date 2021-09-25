package com.skilldistillery.activepotato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	//Submits login form and directs to user home page
	@RequestMapping(path = "login.do", method=RequestMethod.POST)
	public ModelAndView login(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		User u =
		mv.setViewName("userHome");
		return mv;
	}

	//Directs to user registration page
	@RequestMapping(path = "registerpage.do")
	public ModelAndView newUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createProfile");
		return mv;
	}

	//Submits registration form and directs to user home page
	@RequestMapping(path = "register.do", method=RequestMethod.POST)
	public ModelAndView register(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userHome");
		return mv;
	}
	//Directs to edit profile page
	@RequestMapping(path = "editProfile.do")
	public ModelAndView editProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editProfile");
		return mv;
	}
	//Submits edit details form and directs to user home page
	@RequestMapping(path = "edit.do", method=RequestMethod.POST)
	public ModelAndView submitEdits(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userHome");
		return mv;
	}

}
