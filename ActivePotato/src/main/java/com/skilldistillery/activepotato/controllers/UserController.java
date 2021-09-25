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
	private UserDAO userDao;

	// Submits login form and directs to user home page
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String userName, String userPassword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDao.findByUsernameAndPassword(userName, userPassword);
		if (u == null) {
			mv.setViewName("userLogin");
		} else {
			mv.setViewName("userHome");
			session.setAttribute("user", u);
		}
		return mv;
	}

	// Directs to user registration page
	@RequestMapping(path = "registerpage.do")
	public ModelAndView newUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("createProfile");
		} else {
			mv.setViewName("userHome");
		}
		return mv;
	}

	// Submits registration form and directs to user home page
	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public ModelAndView register(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = userDao.createUser(user);
		session.setAttribute("user", u);
		mv.setViewName("userHome");
		return mv;
	}

	// Directs to edit profile page
	@RequestMapping(path = "editProfile.do")
	public ModelAndView editProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.setViewName("editProfile");
		} else {
			mv.setViewName("userLogin");
		}
		return mv;
	}

	// Submits edit details form and directs to user home page
	@RequestMapping(path = "edit.do", method = RequestMethod.POST)
	public ModelAndView submitEdits(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User sessionUser = (User) session.getAttribute("user");
		User updatedUser = userDao.updateUser(sessionUser.getId(), user);
		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		mv.setViewName("userHome");
		return mv;
	}

}
