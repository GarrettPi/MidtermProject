package com.skilldistillery.activepotato.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.CommentDAO;
import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.Comment;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private ActivityDAO actDao;
	
	@Autowired
	private CommentDAO comDao;

	@RequestMapping(path = { "/", "home.do", "userHome.do" })
	public ModelAndView home(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
		mv.setViewName("home");
	} else {
		User user = (User)session.getAttribute("user");
		List<Comment> commentList = comDao.findCommentByUserId(user.getId());
		mv.addObject("user", user);
		mv.addObject("userComments", commentList);
		mv.addObject("acts", actDao.findActivitiesByInterestUserId(user.getId()));
		mv.setViewName("userHome");
	}
		return mv;
	}

	@RequestMapping(path = { "userAdmin.do" })
	public ModelAndView sysAdminAcctAction (HttpSession session) {
		ModelAndView mv = new ModelAndView();
			List<User> allUsers = userDao.userAdminList();
			mv.addObject("allUsers", allUsers);
			mv.setViewName("userAdminMenu");

		return mv;
	}


	// Directs to page with login form
	@RequestMapping(path = "loginpage.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("userLogin");
		} else {
			User user = (User) session.getAttribute("user");
			mv.addObject("acts", actDao.findActivitiesByInterestUserId(user.getId()));
			List<Comment> commentList = comDao.findCommentByUserId(user.getId());
			System.out.println(commentList);
			mv.addObject("userComments", commentList);
			mv.addObject("user", user);
			mv.setViewName("userHome");
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
